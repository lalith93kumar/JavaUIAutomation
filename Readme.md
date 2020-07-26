Website automated: https://www.online-calculator.com/full-screen-calculator/

Instruction: 
1. Open the terminal & follow the below instruction 
2. Download the repo - https://github.com/lalith93kumar/APIAutomationJava.git 
3. Move to the directory
4. cd JavaUIAutomation
5. Install JDK 1.8 
6. Install IntelliJ (Community edition is fine) 
7. Install Gradle

Tech: 
    Language: Java 
    Framework: Junit 
    Build Took: Gradle

Run : gradle clean build test

Cucumber Report: Report Path: build/cucumber-html-report/index.html
Note: Reports contains both the actual & expect images attached in the Report for each testcase.

Bugs: 
    | inputs        | Expected | Actuals |
    | 3/+=          |  3       | 1       |
    | 3/-=          |  3       | 1       |
    | 9 999 999 999+1 | 1e+9    | 2e+9    |(Accepted only 9 digits)
    | 8//           | 8        | Error   |
    | 9 999 999 999-1 | 1e+9    | 2e+9    |(Accepted only 9 digits)
