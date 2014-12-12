Feature: Home Page
  Scenario: Visitor
    Given I go to the homepage
    Then I should see 'Welcome To Twidipity' page title
    And I should see 'Join Twidipity to share in the discovery of Twitter' on the page

  Scenario: Share
    Given I go to the homepage
    Then I should see a Twitter "share" link
