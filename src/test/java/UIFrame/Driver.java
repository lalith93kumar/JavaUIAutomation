package UIFrame;

import cucumber.api.Scenario;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;
import org.openqa.selenium.support.ui.WebDriverWait;
import stepDefinitions.Hooks;
import java.util.concurrent.TimeUnit;

public class Driver {
    public WebDriver webDriver;
    private WebDriverWait wait;

    public Driver setup()
    {
        ChromeOptions options = new ChromeOptions();
        String[] switches = Hooks.propertiesUtil.getPropertyAsString("switches").split(",");
        for(String value : switches)
        {
            options.addArguments(value);
        }
        webDriver = new ChromeDriver(options);
        webDriver.manage().deleteAllCookies();
        return this;
    }

    public void embedScreenshot(Scenario scenario){
        if (scenario.isFailed()) {
            try {
                scenario.write("Current Page URL is " + webDriver.getCurrentUrl());
                byte[] screenshot = ((TakesScreenshot) webDriver).getScreenshotAs(OutputType.BYTES);
                scenario.embed(screenshot, "image/png");
            } catch (WebDriverException somePlatformsDontSupportScreenshots) {
                System.err.println(somePlatformsDontSupportScreenshots.getMessage());
            }

        }
    }

    public void quit()
    {
        webDriver.quit();
    }

    public void switchToFrame(WebElement frame)
    {
        webDriver.switchTo().frame(frame);
    }

    public void revertTo()
    {
        webDriver.switchTo().defaultContent();
    }

    public void get(String url)
    {
        webDriver.get(url);
    }

    public String javaScriptExecuter(String script)
    {
        JavascriptExecutor jsExec = (JavascriptExecutor) webDriver;
        return ""+jsExec.executeScript(script);
    }

    public void setBrowserSize(int x, int y)
    {
        webDriver.manage().window().setSize(new Dimension(x, y));
    }

    public WebElement waitForElementToBeVisible(WebElement element,int time) {
        return waitObject(time).until(ExpectedConditions.visibilityOf(element));
    }

    public WebElement waitForElementToBeVisible(WebElement element) {
        return waitObject(40).until(ExpectedConditions.visibilityOf(element));
    }

    public WebDriverWait waitObject(int time)
    {
        return new WebDriverWait(webDriver, time);
    }

    public FluentWait<WebDriver> fluentWaitObject(int time)
    {
        return new FluentWait<WebDriver>(webDriver)
                .withTimeout(time, TimeUnit.SECONDS)
                .pollingEvery(5, TimeUnit.SECONDS)
                .ignoring(StaleElementReferenceException.class);
    }
}
