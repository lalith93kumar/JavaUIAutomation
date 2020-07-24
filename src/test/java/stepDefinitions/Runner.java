package stepDefinitions;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        strict = true,
        plugin = {
                "pretty",
                "html:build/cucumber-html-report"
        },
        features={ "src/test/resources/features" }
)
public class Runner {

    @BeforeClass
    public static void run() {
    }
}
