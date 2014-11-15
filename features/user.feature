Feature: User
  @omniauth_test
  Scenario: Signin (Allowed)
    Given I go to the new invite page
    When I click on "Signin" as an Admin
    Then I should be on the statement page

  @omniauth_test
  Scenario: Signin (Not Allowed)
    Given I go to the new invite page
    When I click on "Signin"
    Then I should be on the invite page

  @omniauth_test
  Scenario: Signout
    Given I am a signed in user
    When I click on "Signout"
    Then I should be on the invite page
