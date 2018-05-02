Feature: View the flash cards
As a PhD Qual user
So that I can view the random flash cards
I want to see next or previous flash cards

Background: questions in database

Given the following questions exist:
  | question  | option1 | option2 | option3 | option4 | option5 | answer |     category     |
  |  QueCat1  |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat2  |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat3  |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat4  |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
And I am on the home page

Scenario: Show next/previous flash card
Then I should see "Welcome"
When I follow "Start Practice"
Then I should be on Select Category page
When I check the checkbox "Networks"
And I check the checkbox "Algorithms"
And I check the checkbox "Software"
Then I press "Start Practice"

Then I should see "QueCat1"
When I press "Next"
Then I should see "QueCat2"
And I press "Next"
Then I should see "QueCat3"
#And I press "Previous"
#Then I should see "QueCat2"
