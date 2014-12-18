Feature: Home Page
  Scenario: Visitor
    Given I go to the homepage
    Then I should see 'Twidipity' page title
    And I should see 'Follow random people for a day and discover Twitter with Twidipity' on the page
    And I should see 'Signin' on the page

  Scenario: Share
    Given I go to the homepage
    Then I should see a Twitter "Share" link
