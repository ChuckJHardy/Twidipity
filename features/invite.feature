Feature: Invite
  Scenario: Invite
    Given I go to the homepage
    And I click on "Request Invite"
    Then I should see "Welcome To Twidipity" page title
    And I should see "Signin" on the page

  Scenario: Subscribe (Success)
    Given I go to the homepage
    And I click on "Request Invite"
    And I complete and submit a valid subscription form
    Then I should be on the homepage
    And I should see "Check your email" on the page

  Scenario: Subscribe (Failure)
    Given I go to the homepage
    And I click on "Request Invite"
    And I complete and submit an invalid subscription form
    Then I should be on the homepage
    And I should see "An email address must contain a single @" on the page
