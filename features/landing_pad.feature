Feature: Landing Pad
  Scenario: Visitor
    Given I go to the homepage
    Then I should see "Welcome To Twidipity" page title
    And I should see "Coming Soon" on the page
    And I should see "Twidipity" on the page
    And I should see "The discovery of tweets" on the page
    And I should see "Notify" on the page
    And I should see "Share" on the page

  Scenario: Notify
    Given I go to the homepage
    And I click on "Notify"
    Then I should see "Welcome To Twidipity" page title
    And I should see "10/01/2015" on the page

  Scenario: Share
    Given I go to the homepage
    Then I should see a Twitter Share link

  Scenario: Subscribe (Success)
    Given I go to the homepage
    And I click on "Notify"
    And I complete and submit a valid subscription form
    Then I should be on the homepage
    And I should see "Check your email" on the page

  Scenario: Subscribe (Failure)
    Given I go to the homepage
    And I click on "Notify"
    And I complete and submit an invalid subscription form
    Then I should be on the homepage
    And I should see "An email address must contain a single @" on the page
