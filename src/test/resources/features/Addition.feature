Feature: Smoke test for Addition.

  @Addition @Smoke
  Scenario Outline: Check the operation on different browser size: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 1+2+3+4+5+6+7+8+9= |    100,200        |    53     | 45     |
