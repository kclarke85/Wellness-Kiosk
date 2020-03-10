# Date: 3/6/20
# Author: Kevin Clarke
# Discription: For coding challenge
# History: NA

require 'rubygems'
require 'cucumber'
require 'Watir'
require 'faker'

Given(/^TC_101 \- Ensure that the user can navigate to the landing page\.$/) do

  @browser ||= Watir::Browser.new :firefox
  @browser.goto "http://www.way2automation.com/angularjs-protractor/webtables/"

end

And(/^TC_102 \- Ensure that the user can click the add user lable\.$/) do
@browser.button(:class => 'btn btn-link pull-right').click
sleep 4
end

Then(/^TC_103 \- Complete the Add User form with First Name,last Name,Password,Customer,Role,Email and Cell phone\.$/) do

  # Use faker gem to randomize naming conventions

  TC_103_FN = Faker::Name.first_name
    @browser.text_field(:name => 'FirstName').set TC_103_FN

      TC_103_LN = Faker::Name.last_name
        @browser.text_field(:name => 'LastName').set TC_103_LN

        TC_103_username = Faker::Internet.username
          @browser.text_field(:name => 'UserName').set TC_103_username

           TC_103_password = Faker::Internet.password
              @browser.text_field(:name => 'Password').set TC_103_password
                sleep 2
                 @browser.send_keys :tab  # to handle the "connection is not secure warning dismiss the warning with tab "

             # select customer
               @browser.label(:class => 'radio ng-scope ng-binding').click

             # Select Role:  standard elements don't enter the text neither will xpath or css selector  ( Will research)
             select_role  = ['s','c','a'].sample
                  @browser.send_keys :tab
                    @browser.send_keys select_role

  TC_103_email  = Faker::Internet.email
  @browser.text_field(:name => 'Email').set TC_103_email

  TC_103_cell_phone  = Faker::PhoneNumber.cell_phone
  @browser.text_field(:name => 'Mobilephone').set TC_103_cell_phone

end

And(/^TC_ (\d+) \- Click the save button to add the user\.$/) do
# Click Save:  standard elements don't enter the text, neither will xpath or css selector ( Will research)
  sleep 2
  @browser.send_keys :tab, :tab
    @browser.send_keys :enter
       # @browser.button(:class => 'btn btn-success').click
end

And(/^TC_104 \- Click the save button to add the user\.$/) do
  # Click Save:  standard elements don't enter the text, neither will xpath or css selector ( Will research)
  sleep 2
  @browser.send_keys :tab, :tab
  @browser.send_keys :enter
  # @browser.button(:class => 'btn btn-success').click
  # Tab to the delete
  sleep 6
  @browser.send_keys :tab,:tab,:tab,:tab,:tab
  @browser.send_keys :tab,:tab,:tab,:tab,:tab,:tab,:enter
end

Given(/^TC_200 Delete the Novak entry and confirm$/) do
@browser.button(:class => 'btn ng-scope ng-binding btn-primary').click
end

And(/^TC_201 Confirm that the name novak was deleted$/) do
 @browser.text_field(:type => 'text').set "novak"
end

Then(/^TC_202 Write validation Passed Failed to console or report$/) do
validation = @browser.td(:class => 'smart-table-data-cell').exist?

if validation == false
  then puts "TC_100_200_Novak_Deleted_Passed"
    else  puts "TC_100_200_Novak_Deleted_Failed"
        end
            sleep 10
              @browser.close
              end

