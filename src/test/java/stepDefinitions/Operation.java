package stepDefinitions;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import locators.Home;

public class Operation {

    private Home home = new Home(Hooks.driver);

    @And("Send inputs for perform operation: (.*)$")
    public void operationInputs(String expectedDestination) throws InterruptedException {
        Thread.sleep(1000);
        home.calculatorInputs(expectedDestination);
    }

    @Given("Set browser size as (.*)$")
    public void setBrowserSize(String size) {
        int x = Integer.parseInt(size.split(",")[0]);
        int y = Integer.parseInt(size.split(",")[1]);
        Hooks.driver.setBrowserSize(x,y);
    }

    @Then("Verify the output with image filename (.*)$")
    public void verifyOutputWithImage(String filename) throws Exception {
        home.verifyExpectedOutputImage(filename);
    }


    @And("Validate backend as results : (.*)$")
    public void verifyOutputWithBackend(String result) throws Exception {
        home.validateBackendResult(result);
    }
}
