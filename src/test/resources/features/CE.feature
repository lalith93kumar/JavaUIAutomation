Feature: Smoke test for CE button.

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with any operation: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result     |
      | 105256/25+4/2=c     |    800,800        |  114     |    0       |
      | 250678-456-27-3=c   |    800,800        |  115     |    0       |

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with positive and negative numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result     |
      | 2=c                 |    800,800        |  116     |    0       |
      | 3~=c                |    800,800        |  117     |    0       |

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with zero combinations: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs              | BrowserWindowSize | TestID   | Result     |
      | 0=c                 |    800,800        |  118     |    0       |
      | 0~=c                |    800,800        |  119     |    0       |

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with only one operand: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | 3-=c               |    800,800        |   120    |    0   |
      | -8=c               |    800,800        |   121    |    0   |
      | -4-=c              |    800,800        |   122    |    0   |
      | 3--=c              |    800,800        |   123    |    0   |
      | -8-=c              |    800,800        |   124    |    0   |
      | 4-+=c              |    800,800        |   125    |    0   |
      | 6-*=c              |    800,800        |   126    |    0   |
      | 7-/=c              |    800,800        |   127    |    0   |
      | 8-/=c              |    800,800        |   128    |    0   |
      | 3-/=c              |    800,800        |   129    |    0   |

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with positive and negative decimal numbers: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result   |
      | 0.5-0.7=c          |    800,800        |  130     |    0     |
      | 0.00003~-0.003~=c  |    800,800        |  131     |    0     |

  @CE @Smoke
  Scenario Outline: Check whether CE button is operating with operators: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result |
      | -=c                |    800,800        |   132    |    0   |
      | +=c                |    800,800        |   133    |    0   |
      | *=c                |    800,800        |   134    |    0   |
      | *-=c               |    800,800        |   135    |    0   |
      | +-=c               |    800,800        |   136    |    0   |

  @CE @Smoke
  Scenario Outline: Check whether the operation performed after pressing CE button displays result: <TestID>
    Given Set browser size as <BrowserWindowSize>
    And Send inputs for perform operation: <Inputs>
    Then Verify the output with image filename <TestID>
    And Validate backend as results : <Result>
    Examples:
      | Inputs             | BrowserWindowSize | TestID   | Result    |
      | -=c4/2=            |    800,800        |   137    |    2      |
      | +=c250678-456-27=  |    800,800        |   138    | 250 195   |

  @CE @Smoke
  Scenario: Check whether zero is displayed before pressing CE button: 155
    Given Set browser size as 800,800
    Then Verify the output with image filename 155
    And Validate backend as results : 0
