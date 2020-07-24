Feature: Smoke test for Subtraction.

  @Subtraction @Smoke
  Scenario Outline: Check the operation on different browser size: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID    | Result  |
      | 1-2-3-4-5-6-7-8-9= |    100,200        |    32     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    100,150        |    33     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    200,250        |    34     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    300,350        |    35     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    400,450        |    36     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    500,550        |    37     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    600,650        |    38     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    700,750        |    39     | -43     |
      | 1-2-3-4-5-6-7-8-9= |    800,850        |    40     | -43     |

  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of positive and negative number: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result |
      | 1-2+3~-4-5~-6 =     |    800,800        |   41     |    -9  |
      | 1+2-3~-4~-5~+6 =    |    800,800        |   42     |    21   |

  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of negative numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result |
      | 3~-5~  =            |    800,800        |   43     |    2   |
      | 4~-5~-8~-2~-3~ =    |    800,800        |   44     |    14  |
  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of only one operand: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 3-                 |    800,800        |   45     |    3   |
      | -8                 |    800,800        |   46     |    8   |
      | -4-                |    800,800        |   47     |    -4  |
      | 3--                |    800,800        |   48     |    3   |
      | -8-                |    800,800        |   49     |    -8  |
      | 4-+                |    800,800        |   50     |    4   |
      | 6-*                |    800,800        |   51     |    6   |
      | 7-/                |    800,800        |   52     |    7   |
      | 8-/                |    800,800        |   53     |    8   |
      | 3-/=               |    800,800        |   54     |    3   |

  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of positive decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result   |
      | 0.5-0.5=           |    800,800        |   55     |    0     |
      | 0.00003-0.003=     |    800,800        |   56     | -0.00297 |

  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of negative decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs                    | BrowserWindowSize | TestID   | Result |
      | 0.3~-0.5~=                |    800,800        |   57     |   0.2  |
      | 0.4~-0.5~-0.8~-0.2~-0.3~= |    800,800        |   58     |    1.4 |


  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of zero combinations: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0-0=    |    800,800        |   59     |    0   |
      | 0~-0~=  |    800,800        |   60     |    0   |
      | 0-0~=   |    800,800        |   61     |    0   |
      | 0~-0=   |    800,800        |   62     |    0   |

  @Subtraction @Smoke
  Scenario Outline: Check the Subtraction of any number with zero: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0-5=    |    800,800        |   110    |   -5   |
      | 5~-0~=  |    800,800        |   111    |   -5   |
      | 0-3~=   |    800,800        |   112    |    3   |
      | 0~-3=   |    800,800        |   113    |   -3   |