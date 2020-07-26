Feature: Smoke test for Addition.

  @Addition @Smoke
  Scenario Outline: Check the operation on different browser size: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 1+2+3+4+5+6+7+8+9= |    100,200        |    1     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    100,150        |    2     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    200,250        |    3     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    300,350        |    4     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    400,450        |    5     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    500,550        |    6     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    600,650        |    7     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    700,750        |    8     | 45     |
      | 1+2+3+4+5+6+7+8+9= |    800,850        |    9     | 45     |

  @Addition @Smoke
  Scenario Outline: Check the addition of positive and negative number: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 1+2+3~+4+5~+6 =    |    800,800        |   10     |     5  |
      | 1+2+3~+4~+5~+6 =   |    800,800        |   11     |    -3  |

  @Addition @Smoke
  Scenario Outline: Check the addition of negative numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 3~+5~  =           |    800,800        |   12     |    -8  |
      | 4~+5~+8~+2+3~ =    |    800,800        |   13     |    -18 |

  @Addition @Smoke
  Scenario Outline: Check the addition of only one operand: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 3+                 |    800,800        |   14     |    3   |
      | +8                 |    800,800        |   15     |    8   |
      | +4+                |    800,800        |   16     |    4   |
      | 3++                |    800,800        |   17     |    3   |
      | +8-                |    800,800        |   18     |    8   |
      | 4+-                |    800,800        |   19     |    4   |
      | 6+*                |    800,800        |   20     |    6   |
      | 7+/                |    800,800        |   21     |    7   |
      | 8+/                |    800,800        |   22     |    8   |
      | 3+/=               |    800,800        |   23     |    3   |

  @Addition @Smoke
  Scenario Outline: Check the addition of positive decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs            | BrowserWindowSize | TestID   | Result |
      | 0.5+0.5=          |    800,800        |   24     |    1   |
      | 0.00003+0.003=    |    800,800        |   25     |0.00303 |

  @Addition @Smoke
  Scenario Outline: Check the addition of negative decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs                    | BrowserWindowSize | TestID   | Result  |
      | 0.3~+0.5~=                |    800,800        |   26     |    -0.8 |
      | 0.4~+0.5~+0.8~+0.2~+0.3~= |    800,800        |   27     |    -2.2 |


  @Addition @Smoke
  Scenario Outline: Check the addition of zero combinations: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0+0=    |    800,800        |   28     |    0   |
      | 0~+0~=  |    800,800        |   29     |    0   |
      | 0+0~=   |    800,800        |   30     |    0   |
      | 0~+0=   |    800,800        |   31     |    0   |

  @Addition @Smoke
  Scenario Outline: Check the addition of any number with zero: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0+5=    |    800,800        |   106    |    5   |
      | 5~+0~=  |    800,800        |   107    |   -5   |
      | 0+3~=   |    800,800        |   108    |   -3   |
      | 0~+3=   |    800,800        |   109    |    3   |

  @Addition @Smoke
  Scenario Outline: Analysis in addition operation: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result      |
      |999999999+1=|    800,800     |   140    |  1e+9       |
      |999999999~+1=|    800,800    |   141    |  -999 999 998  |
      |999999999+1~=|    800,800    |   142    |  999 999 998  |
      |999999999~+1~=|    800,800   |   143    |  -1e+9      |

  @Addition @Smoke
  Scenario Outline: Analysis of boundary value in addition operation: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result   |
      |9999999999+1=|    800,800    |   154    |  1e+9    |
      |999999998+1=|    800,800     |   155    | 999 999 999|