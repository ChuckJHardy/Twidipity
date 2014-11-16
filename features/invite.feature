Feature: Invite
  Scenario: Invite
    Given I go to the homepage
    And I click on "Request Invite"
    Then I should see "Welcome To Twidipity" page title
    And I should see "Signin" on the page

  Scenario: Subscribe
    Given I go to the homepage
    When I click on "Request Invite"
    And I input "TestHandle" as my Twitter Handle
