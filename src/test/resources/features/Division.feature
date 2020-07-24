Feature: Smoke test for Division.

  @Division @Smoke
  Scenario Outline: Check the operation on different browser size: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID    | Result     |
      | 4000/80/25/3/2=    |    100,200        |    63     | 0.33333333 |
      | 4000/80/25/3/2=    |    100,150        |    64     | 0.33333333 |
      | 4000/80/25/3/2=    |    200,250        |    65     | 0.33333333 |
      | 4000/80/25/3/2=    |    300,350        |    66     | 0.33333333 |
      | 4000/80/25/3/2=    |    400,450        |    67     | 0.33333333 |
      | 4000/80/25/3/2=    |    500,550        |    68     | 0.33333333 |
      | 4000/80/25/3/2=    |    600,650        |    69     | 0.33333333 |
      | 4000/80/25/3/2=    |    700,750        |    70     | 0.33333333 |
      | 4000/80/25/3/2=    |    800,850        |    71     | 0.33333333 |


  @Division @Smoke
  Scenario Outline: Check the division of positive numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result     |
      | 105256/250/20/4/2=  |    800,800        |   72     | 2.6314     |
      | 250678/456/27/3=    |    800,800        |   73     | 6.78682045 |


  @Division @Smoke
  Scenario Outline: Check the division of positive and negative numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result      |
      | 105256/250~/20/4~=  |    800,800        |   74     | 5.2628      |
      | 250678/456~/27=     |    800,800        |   75     | -20.3604613 |

  @Division @Smoke
  Scenario Outline: Check the division of negative numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result       |
      | 80000~/60~/25~/2~=  |    800,800        |   76     | 26.6666667   |
      | 690656~/35~/8~=     |    800,800        |   77     | -2 466.62857 |

  @Division @Smoke
  Scenario Outline: Check the division of negative and positive numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result       |
      | 80000~/60/25~/3/2~= |    800,800        |   78     | -8.88888889  |
      | 690656~/35/8=       |    800,800        |   79     | -2 466.62857 |


  @Division @Smoke
  Scenario Outline: Check the division of only one operand: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 3/                 |    800,800        |   80     |  3     |
      | /8                 |    800,800        |   81     |  8     |
      | +4/                |    800,800        |   82     |  4     |
      | 3//                |    800,800        |   83     |  3     |
      | -8/                |    800,800        |   84     |  8     |
      | 4/+                |    800,800        |   85     |  4     |
      | 6/*                |    800,800        |   86     |  6     |
      | 7-/                |    800,800        |   87     |  7     |
      | 8//                |    800,800        |   88     |  8     |
      | 0-/=               |    800,800        |   89     |  3     |

  @Division @Smoke
  Scenario Outline: Check the division of positive decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result     |
      | 0.5/0.25/0.2=      |    800,800        |   90     | 10         |
      | 0.00003/0.83/0.30= |    800,800        |   91     | 0.00012048 |

  @Division @Smoke
  Scenario Outline: Check the division of negative decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs                    | BrowserWindowSize | TestID   | Result     |
      | 0.3~/0.5~=                |    800,800        |   92     | 0.6        |
      | 0.4045~/0.55~/0.8~/0.2~=  |    800,800        |   93     | 4.59659091 |


  @Division @Smoke
  Scenario Outline: Check the division of zero combinations: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0/0=    |    800,800        |   94     | Error  |
      | 0~/0~=  |    800,800        |   95     | Error  |
      | 0/0~=   |    800,800        |   96     | Error  |
      | 0~/0=   |    800,800        |   97     | Error  |


  @Division @Smoke
  Scenario Outline: Check the division of any number by zero should report error: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 25/0=   |    800,800        |   98     | Error  |
      | 5~/0=   |    800,800        |   99     | Error  |
      | 0.4/0~= |    800,800        |   100    | Error  |
      | 999999999/0=|    800,800    |   101    | Error  |

  @Division @Smoke
  Scenario Outline: Check the division of zero by any number: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs  | BrowserWindowSize | TestID   | Result |
      | 0/5=    |    800,800        |   102    | 0      |
      | 0/3~=   |    800,800        |   103    | 0      |
      | 0~/5~=  |    800,800        |   104    | 0      |
      | 0/999999999=|    800,800    |   105    | 0      |
