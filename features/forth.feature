Feature: Attempt a quiz
As a PhD candidate
I want to attempt a quiz

Background: questions in database

Given the following questions exist:
  | question  | option1 | option2 | option3 | option4 | option5 | answer |     category     |
  |  QueCat1  |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat2  |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat3  |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat4  |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
  |  QueCat5  |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat6  |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat7  |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat8  |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
  |  QueCat9  |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat10 |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat11 |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat12 |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
  |  QueCat13 |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat14 |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat15 |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat16 |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
  |  QueCat17 |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat18 |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat19 |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat20 |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
Given I am on the homepage

Scenario: Attempting a quiz and seeing the performance at the end
When I follow "Start Quiz"
Then I should be on Quiz Category page
When I choose radio button "20"
And I press "Start Quiz"
Then I should see "Category: Networks"
When I press "Next"
Then I should see "Category: Algorithms"
When I press "Next"
Then I should see "Category: Software"
When I press "Next"
Then I should see "Category: Operating System"
And I should see "Submit"
