Feature: Select Flash Cards based on category

Background: questions in database

Given the following questions exist:
  | question  | option1 | option2 | option3 | option4 | option5 | answer |     category     |
  |  QueCat1  |   AA    |   BB    |    CC   |   DD    |   EE    |   BB   |     Networks     |
  |  QueCat2  |   AA    |   BB    |    CC   |   DD    |   EE    |   DD   |    Algorithms    |
  |  QueCat3  |   AA    |   BB    |    CC   |   DD    |   EE    |   CC   |     Software     |
  |  QueCat4  |   AA    |   BB    |    CC   |   DD    |   EE    |   EE   | Operating System |
And I am on the home page

Scenario: Select a single Category
    Then I should see "Welcome to the PhDQual Flash Cards"
    When I follow "Start Practice"
    Then I should be on Select Category page
    And I should see "Select a Category"
    When I check the checkbox "Networks"
    And I press "Start Practice"
    Then I should see "QueCat1"
    And I should see "Category: Networks"

Scenario: Select multiple categories
    Given I am on Select Category page
    Then I should see "Networks"
    And I should see "Algorithms"
    When I check the checkbox "Networks"
    And I check the checkbox "Algorithms"
    And I check the checkbox "Software"
    And I press "Start Practice"
    Then I should see "Category: Networks"
    When I press "Next"
    Then I should see "Category: Algorithms"
    When I press "Next"
    Then I should see "Category: Software"
