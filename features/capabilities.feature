# Creation Date: 3/05/20
# Author Kevin Clarke
# Type: Smoke & Sanity
# Priority: High
# Created in release: ( x )
# Created in Build    ( x  )

#------------- Pre conditions ----------------------

# As an Engr. Candidate
# I need to automate http://www.way2automation.com/angularjs-protractor/webtables/
# So I can show my automation capabilities


  Feature: Candidate Code Challenge

  Scenario: Test Case 100 - 200  Validate user has been added to the table

  Given TC_101 - Ensure that the user can navigate to the landing page.
  And   TC_102 - Ensure that the user can click the add user lable.
  Then  TC_103 - Complete the Add User form with First Name,last Name,Password,Customer,Role,Email and Cell phone.
  And   TC_104 - Click the save button to add the user.

 # Scenario: Test Case 200 Delete user User Name: novak and validate user has been deleted

 Then TC_200 Delete the Novak entry and confirm
 But Confirm that the name novak was deleted
 Then Write validation Passed Failed to console or report