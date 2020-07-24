package UIFrame;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import stepDefinitions.Hooks;

@Getter
@Setter
@Builder
public class JSLocator {
    private String GlobalVariable;
    private String JSVariableName;
    private WebElement ParentElement;
    private int XAxis;
    private int YAxis;
    public void click()
    {
        new Actions(Hooks.driver.webDriver).moveToElement(ParentElement,0,0).moveByOffset(getXAxis(),getYAxis()).click().build().perform();
    }

    public void getCanvasElementXPosition()
    {
        int units = (getParentElement().getSize().width/5);
        setXAxis((getXAxis()*units)+(units/2));
    }

    public Double getCanvasElementHeight()
    {
        return Double.parseDouble(Hooks.driver.javaScriptExecuter("return "+GlobalVariable+"."+JSVariableName+".lineHeight"));
    }

    public String getCanvasElementText()
    {
        return Hooks.driver.javaScriptExecuter("return "+GlobalVariable+"."+JSVariableName+".text");
    }

    public void getCanvasElementYPosition()
    {
        int units = (getParentElement().getSize().height/6);
        setYAxis(((getYAxis()*units)+(units/2)));
    }
}
