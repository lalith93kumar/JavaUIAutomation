package locators;

import UIFrame.Driver;
import UIFrame.JSLocator;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.internal.WrapsDriver;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import stepDefinitions.Hooks;
import utility.CompareUtil;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

public class Home {

    private final Driver driver;

    @FindBy(id = "canvas")
    WebElement Canvas;

    @FindBy(id = "fullframe")
    WebElement CanvasIframe;

    JSLocator EqualButton;
    JSLocator MinusButton;
    JSLocator DivideButton;
    JSLocator PlusButton;
    JSLocator Num0Button;
    JSLocator Num1Button;
    JSLocator Num2Button;
    JSLocator Num3Button;
    JSLocator Num4Button;
    JSLocator Num5Button;
    JSLocator Num6Button;
    JSLocator Num7Button;
    JSLocator Num8Button;
    JSLocator Num9Button;
    JSLocator ShowScreenText;
    JSLocator PlusMinus;
    JSLocator DotButton;
    public Home(Driver driver) {
        this.driver = driver;
        PageFactory.initElements(driver.webDriver, this);
        EqualButton = JSLocator.builder().ParentElement(Canvas).XAxis( 4).YAxis(5).build();
        PlusButton = JSLocator.builder().ParentElement(Canvas).XAxis(3).YAxis(5).build();
        MinusButton = JSLocator.builder().ParentElement(Canvas).XAxis(3).YAxis(4).build();
        DivideButton = JSLocator.builder().ParentElement(Canvas).XAxis(3).YAxis(2).build();
        Num0Button = JSLocator.builder().ParentElement(Canvas).XAxis(0).YAxis(5).build();
        Num1Button = JSLocator.builder().ParentElement(Canvas).XAxis(0).YAxis(4).build();
        Num2Button = JSLocator.builder().ParentElement(Canvas).XAxis(1).YAxis(4).build();
        Num3Button = JSLocator.builder().ParentElement(Canvas).XAxis(2).YAxis(4).build();
        Num4Button = JSLocator.builder().ParentElement(Canvas).XAxis(0).YAxis(3).build();
        Num5Button = JSLocator.builder().ParentElement(Canvas).XAxis(1).YAxis(3).build();
        Num6Button = JSLocator.builder().ParentElement(Canvas).XAxis(2).YAxis(3).build();
        Num7Button = JSLocator.builder().ParentElement(Canvas).XAxis(0).YAxis(2).build();
        Num8Button = JSLocator.builder().ParentElement(Canvas).XAxis(1).YAxis(2).build();
        Num9Button = JSLocator.builder().ParentElement(Canvas).XAxis(2).YAxis(2).build();
        PlusMinus = JSLocator.builder().ParentElement(Canvas).XAxis(2).YAxis(5).build();
        DotButton = JSLocator.builder().ParentElement(Canvas).XAxis(1).YAxis(5).build();
        ShowScreenText = JSLocator.builder().ParentElement(Canvas).GlobalVariable("exportRoot").JSVariableName("showscreen_txt").build();
    }

    public void calculatorInputs(String input) throws InterruptedException {
        calculatorSeleniumAxis();
        driver.switchToFrame(CanvasIframe);
        for(char value : input.toCharArray())
        {
            if(value=='=')
                EqualButton.click();
            if(value=='0')
                Num0Button.click();
            if(value=='1')
                Num1Button.click();
            if(value=='2')
                Num2Button.click();
            if(value=='3')
                Num3Button.click();
            if(value=='4')
                Num4Button.click();
            if(value=='5')
                Num5Button.click();
            if(value=='6')
                Num6Button.click();
            if(value=='7')
                Num7Button.click();
            if(value=='8')
                Num8Button.click();
            if(value=='9')
                Num9Button.click();
            if(value=='+')
                PlusButton.click();
            if(value=='-')
                MinusButton.click();
            if(value=='%')
                DivideButton.click();
            if(value=='~')
                PlusMinus.click();
            if(value=='.')
                DotButton.click();
        }
        driver.revertTo();
    }

    public void calculatorSeleniumAxis()
    {
        driver.switchToFrame(CanvasIframe);
        setXYValues(EqualButton);
        setXYValues(PlusButton);
        setXYValues(MinusButton);
        setXYValues(DivideButton);
        setXYValues(Num0Button);
        setXYValues(Num1Button);
        setXYValues(Num2Button);
        setXYValues(Num3Button);
        setXYValues(Num4Button);
        setXYValues(Num5Button);
        setXYValues(Num6Button);
        setXYValues(Num7Button);
        setXYValues(Num8Button);
        setXYValues(Num9Button);
        setXYValues(PlusMinus);
        setXYValues(DotButton);
        driver.revertTo();
    }
    public void setXYValues(JSLocator element) {
        element.getCanvasElementXPosition();
        element.getCanvasElementYPosition();
    }

    public boolean checkIfFileExist(String fileName)
    {
        File f = new File(expectedFilePath(fileName));
        return f.exists() && !f.isDirectory();
    }

    public void verifyExpectedOutputImage(String fileName) throws Exception {
        driver.switchToFrame(CanvasIframe);
        WebElement element = driver.webDriver.findElement(By.id("canvas"));
        if(!checkIfFileExist(fileName))
        {
            File actualImage = extractCalculatorImage(captureImage(element),element);
            driver.revertTo();
            saveExpectedImage(actualImage,fileName);
        }
        else{
            File actualImage = extractCalculatorImage(captureImage(element),element);
            driver.revertTo();
            Assert.assertEquals(CompareUtil.Result.Matched, CompareUtil.CompareImage(expectedFilePath(fileName), actualImage.getPath()));
        }
    }

    public String expectedFilePath(String fileName)
    {
        return System.getProperty("user.dir")+Hooks.propertiesUtil.getPropertyAsString("expected_image_path")+fileName+".png";
    }

    public void saveExpectedImage(File file,String fileName)
    {
        try {
            FileUtils.copyFile(file,new File(expectedFilePath(fileName)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public File extractCalculatorImage(File screen,WebElement element) throws IOException {

        BufferedImage img = ImageIO.read(screen);

        int width = Integer.parseInt(element.getAttribute("width"));
        int height = (int)((Double.parseDouble(element.getAttribute("height"))/270)*(ShowScreenText.getCanvasElementHeight()+30));
        int windowX = (Hooks.driver.webDriver.manage().window().getSize().width-element.getSize().getWidth())/2;

        Rectangle rect = new Rectangle(width, height);

        Point p = element.getLocation();

        BufferedImage dest = img.getSubimage((int) (p.getX()+windowX), p.getY(), rect.width,
                rect.height);
        ImageIO.write(dest, "png", screen);
        return screen;
    }
    public File captureImage(WebElement element)
    {
        WrapsDriver wrapsDriver = (WrapsDriver) element;
        return ((TakesScreenshot) wrapsDriver.getWrappedDriver())
                .getScreenshotAs(OutputType.FILE);
    }

    public void validateBackendResult(String result)
    {
        driver.switchToFrame(CanvasIframe);
        Assert.assertEquals(result,ShowScreenText.getCanvasElementText());
        driver.revertTo();
    }


}
