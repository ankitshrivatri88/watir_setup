Feature:  Login to Google page

  @Google @Login_page
  Scenario:  User can login to google page
    Given user is on google page
    #And I click on Sign in button
    When a user enters username
    When a user enters password
    Then I return to homepage