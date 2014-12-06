Feature: Invite
  Scenario: Visitor
    Given I go to the homepage
    Then I should see 'Welcome To Twidipity' page title
    And I should see 'Twitter Discovery with Twidipity' on the page
    And I should see 'Request Invite' on the page
    And I should see 'Share' on the page

  Scenario: Share
    Given I go to the homepage
    Then I should see a Twitter Share link
