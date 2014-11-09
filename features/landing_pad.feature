Feature: Landing Pad
  Scenario: Visitor
    Given I go to the homepage
    Then I should see "Welcome To Twidipity" page title
    And I should see "Coming Soon" on the page
    And I should see "Twidipity" on the page
    And I should see "The discovery of tweets" on the page
    And I should see "Notify" on the page

  Scenario: Notify
    Given I go to the homepage
    And I click on "Notify"
    Then I should see "Welcome To Twidipity" page title
    And I should see "10/01/2015" on the page
