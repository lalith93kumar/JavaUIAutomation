package testrailsUtility;

import com.codepine.api.testrail.TestRail;
import com.codepine.api.testrail.model.Project;
import com.codepine.api.testrail.model.Result;
import com.codepine.api.testrail.model.ResultField;
import com.codepine.api.testrail.model.Run;
import stepDefinitions.Hooks;

import java.util.List;

import static stepDefinitions.Hooks.*;

public class TestRailIntegrationClient {
    //Projects
    private  int AUTOMATION_PROJECT_ID = 1;

    //Suites
    private  int AUTOMATION_SUITE_ID = 14;


    //Section
    private  int AUTOMATION_SECTION = 14;


    private int AUTOMATION_CASE = 31;

    //Test Case Status IDs
    private int TEST_FAILED_STATUS_ID = 5;
    private int TEST_PASSED_STATUS_ID = 1;

    //Test Rail Authorization
    private String TEST_RAIL_USERNAME = "";
    private String TEST_RAIL_PASSWORD = "";

    TestRail.Cases cases;
    TestRail testRail;
    Project project;
    TestRail.Suites suites;
    TestRail.Sections sections;
    Run genericTestRun;

    List<ResultField> customResultFields;

    public TestRailIntegrationClient() {
        TEST_RAIL_USERNAME = propertiesUtil.getPropertyAsString("testrails_username");
        TEST_RAIL_PASSWORD = propertiesUtil.getPropertyAsString("testrails_password");
        this.testRail = TestRail.builder(propertiesUtil.getPropertyAsString("testrails_url"), TEST_RAIL_USERNAME, TEST_RAIL_PASSWORD).applicationName("playground").build();
        this.project = testRail.projects().get(AUTOMATION_PROJECT_ID).execute();
        this.suites = testRail.suites();
        this.sections = testRail.sections();
        this.cases = testRail.cases();
        this.genericTestRun = testRail.runs().get(Integer.parseInt(propertiesUtil.getPropertyAsString("testrails_run_id"))).execute();
    }

    private void addResultToRun(Integer testCaseId, boolean passed, Run run) {
        if (passed) {
            List<ResultField> customResultFields = testRail.resultFields().list().execute();
            testRail.results().addForCase(run.getId(), testCaseId, new Result().setStatusId(TEST_PASSED_STATUS_ID), customResultFields).execute();
        } else {
            List<ResultField> customResultFields = testRail.resultFields().list().execute();
            testRail.results().addForCase(run.getId(), testCaseId, new Result().setStatusId(TEST_FAILED_STATUS_ID), customResultFields).execute();
        }
    }

    public void addResultToSuite(String suite, Integer testCaseId, boolean passed) {

        switch (suite) {
            case "Master":
                addResultToRun(testCaseId, passed, genericTestRun);
                break;
            default: {
                System.out.println("Suite " + suite + " not recognised within Test Rail");
            }
        }
    }

    public void finishRun() {
        // close the run
        testRail.runs().close(genericTestRun.getId()).execute();

        // complete the project - supports partial updates
        testRail.projects().update(project.setCompleted(true)).execute();
    }
}
