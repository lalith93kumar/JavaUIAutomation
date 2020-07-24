package stepDefinitions;

import UIFrame.Driver;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import testrailsUtility.TestRailIntegrationClient;
import utility.PropertiesUtil;
import utility.ScenarioContext;

public class Hooks {
    public static Driver driver;
    public static PropertiesUtil propertiesUtil;

    @Before
    public void setProperties()
    {
        Hooks.propertiesUtil = new PropertiesUtil("local");
    }

    @Before
    public void initiateWebdriver()
    {
        driver = new Driver().setup();
        driver.get(Hooks.propertiesUtil.getPropertyAsString("test-url"));
    }

    @After
    public void embedScreenshot(Scenario scenario) {
        driver.embedScreenshot(scenario);
    }

    @After
    public void killBrowser()
    {
        driver.quit();
    }

    @After
    public void afterScenario(Scenario scenario) {
//        TestRailIntegrationClient testrailclient = new TestRailIntegrationClient();
//        if (!scenario.isFailed()) {
////            testrailclient.addResultToSuite(
////                    (String) ScenarioContext.getInstance().getData("suite"),
////                    Integer.valueOf((String) ScenarioContext.getInstance().getData("test-case-id")),
////                    true);
//        }
//        else if (scenario.isFailed())
//        {
////            testrailclient.addResultToSuite(
////                    (String) ScenarioContext.getInstance().getData("suite"),
////                    Integer.valueOf((String) ScenarioContext.getInstance().getData("test-case-id")),
////                    false);
//        }
    }
}
