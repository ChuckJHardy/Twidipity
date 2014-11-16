Feature: Invite
  Scenario: Invite
    Given I go to the homepage
    And I click on 'Request Invite'
    Then I should see 'Welcome To Twidipity' page title
    And I should see 'Signin' on the page

  Scenario: Subscribe Email (Success)
    Given I go to the homepage
    And I click on 'Request Invite'
    And I complete and submit a valid email
    Then I should be on the homepage
    And I should see ':)' on the page

  Scenario: Subscribe Email (Failure)
    Given I go to the homepage
    And I click on 'Request Invite'
    And I complete and submit an invalid email
    Then I should be on the homepage
    And I should see ':(' on the page

  @omniauth_test
  Scenario: Subscribe Twitter
    Given I go to the homepage
    And I click on 'Request Invite'
    And I complete and submit a valid twitter handle
    Then I should be on the homepage
    And I should see ':)' on the page
