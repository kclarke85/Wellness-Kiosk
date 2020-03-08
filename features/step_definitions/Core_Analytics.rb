# Date: 11/15/16
# Author: Kevin Clarke
# Discription: initial framework design.
# History: NA
# Notes: using the htmml report formatter :cucumber features --format html --out report.html --format pretty
# Note: Ansicon is not working as expected is disabled at startup.
require 'rubygems'
require 'cucumber'
require 'Watir'
require 'rspec'
#require 'faker'
#require 'selenium-webdriver'
#require 'chromedriver-installer'



Given(/^The User Navigates to the Core Application$/) do
#@browser ||= Watir::Browser.new :ff
#b = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
#b = Watir::Browser.new :chrome, :switches => %w[--proxy-server=myproxy.com:8080]
@browser.goto "https://multi-tenant-dev-1.gridasaservice.com/login?timeout=true"
end

And(/^Verify that the SensusAnalytics link is visable$/) do
  img_SensusAnalytics = @browser.img(:src => '/public/images/gaas-logo.png').exists?

  if img_SensusAnalytics  = true
    puts "The SensusAnalytics link is visiable"
  else puts "The SensusAnalytics link is not visable"
  end
end

Then(/^The User enters a valid userID$/) do
@browser.text_field(:id => 'uname').when_present.set 'system@sensus-analytics.com'
end

Then(/^The enters a valid password$/) do
@browser.text_field(:id => 'password').when_present.set 'verdeeco123'
end

And(/^Verify that the reset link is present$/) do
  reset_val = @browser.a(:id => 'forgot_password_link').exists?

  if reset_val = true
    puts "The link is visiable"
      else puts "The reset link is not visable"
  end
      end

And(/^Verify that the social media icons are present$/) do

  img_facebook = @browser.img(:src => '/public/images/facebook-icon.png').exists?
   img_twitter = @browser.img(:src => '/public/images/twitter-icon.png').exists?
    img_youtube = @browser.img(:src => '/public/images/youtube-icon.png').exists?

   if img_facebook or img_twitter or img_youtube = true
    puts "Social Media link is visable"
      end
end

Then(/^The User clicks the Login button$/) do
@browser.button(:id => 'login_btn').click
end

Given(/^Login to the CORE application go to Admin\/Customer Portal\/Dashboard Widgets$/) do
 @browser ||= Watir::Browser.new :ff
#b = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
#b = Watir::Browser.new :chrome, :switches => %w[--proxy-server=myproxy.com:8080]
@browser.goto "https://multi-tenant-dev-1.gridasaservice.com/login?timeout=true"
end

Given(/^Login to Core$/) do
  pending
end

Then(/^Enter the Username and Password$/) do
  @browser.text_field(:id => 'uname').when_present.set 'system@sensus-analytics.com'
  @browser.text_field(:id => 'password').when_present.set 'verdeeco123'
  @browser.button(:id => 'login_btn').click

# Check to determine if login error is shown ...
  @browser.p(:class => 'ui-state-highlight p10 alert-message error').exist?



end

Then(/^Select Utility and click the OK button$/) do
  @browser.a(:class => 'chosen-single chosen-default').wait_until_present.click
  @browser.send_keys :enter
  @browser.button(:id => 'utility-btn-save').wait_until_present.click
  sleep 5
end

Then(/^Click Account Status$/) do
# @browser.img(:src => '/public/images/accountstatusmanagement.png').click
  sleep 2
 @browser.send_keys :tab, :tab ,:tab,:tab,:tab
  @browser.send_keys :enter
end

Then(/^Admin Icon$/) do
 @browser.img(:class => 'h100').wait_until_present.click
end

Then(/^Verify Search button accepts alpha numeric range\.$/) do
  @browser.input(:class => 'form-control input-sm').exists?
end

Then(/^Verify Show Entries range is. (\d+), (\d+), (\d+) and (\d+)\.$/) do
  log_error=@browser.select(:name => 'accountStatusTable_length').exists?
  if log_error = true
    Puts "login error foubd"
    @browser.close
  end
end

Then(/^Verify that the Previous and Next buttons are visable\.$/) do
  @browser.a(:href => '#Previous').exists?
     @browser.a(:href => '#Next').exists?
end

Then(/^Click the Create New Account Status$/) do
  sleep 2
  @browser.button(:id => 'create-account-status-btn').click
end

Then(/^Enter Account Status Name$/) do
  title = "Sensus Automation Test"
  time = Time.now.strftime("%d/%m/%Y %H:%M")
    name_status = Faker::Address.city
      validation_Account_N =  name_status + time + " " + title
        @browser.text_field(:id => 'account-status-create-name').set validation_Account_N
  end

And(/^Verify that the close button is enabled$/) do
 @browser.button(:id => 'account-status-create-cancel').exists?
end

Then(/^Click the Save Button$/) do
  @browser.button(:id => 'account-status-create-save').click
end

And(/^Delete a previuosly  created account$/) do
  title = "Sensus Automation Test"
    @browser.text_field(:class => 'form-control input-sm').set title
      @browser.button(:class => 'btn btn-default menu-row-delete').click
       sleep 2
          @browser.button(:id => 'account-status-delete-confirm').click

end

Then(/^Click App$/) do
  sleep 2
  @browser.send_keys :tab, :tab ,:tab,:tab,:tab ,:tab
  @browser.send_keys :enter
end

Then(/^Click the Create New App$/) do
 @browser.button(:id => 'create-app-btn').click
end

Then(/^Enter App Name$/) do
  title = "Sensus Automation Test"
    time = Time.now.strftime("%d/%m/%Y %H:%M")
  name_status = Faker::Address.city
  validation_Account_N =  name_status + " " + time + " " + title
  @browser.text_field(:id => 'app-create-name').set validation_Account_N
  sleep 1
  @browser.select_list(:id => 'app-create-type').select 'Insight' # Select Type
  sleep 1
  @browser.text_field(:id => 'app-create-short-name').set name_status # Short Name
  sleep 1
  @browser.text_field(:id =>'app-create-description').set title # Discription
  sleep 2
  @browser.select_list(:id => 'app-create-wrap-type').select 'Report' # Wrap Type
  sleep 2
  @browser.text_field(:id =>'app-create-wrapped-url').set "N/A" # Wrapped URL
end

Then(/^Click Create New Button APP$/) do
  sleep 2
@browser.button(:class => 'btn btn-default').click
   end

Then(/^click the save button\.$/) do
 @browser.button(:class => 'btn btn-primary').click
end

And(/^Delete a previuosly  created account per diff element$/) do
  title = "Sensus Automation Test"
  @browser.text_field(:class => 'form-control input-sm').set title
  @browser.button(:class => 'btn btn-default menu-row-delete').click
  sleep 2
 @browser.button(:id => 'app-delete-confirm').click
end

Then(/^Click Billing Cycle$/) do
  sleep 2
  @browser.send_keys :tab, :tab ,:tab,:tab,:tab ,:tab,:tab
  @browser.send_keys :enter
end

Then(/^Click the Create New Billing Cycle$/) do
  sleep 2
@browser.button(:id => 'create-billingcycle-btn').click
end

Then(/^Enter Billing Cycle  Name$/) do
  title = "Sensus Automation Test"
  time = Time.now.strftime("%d/%m/%Y %H:%M")
  name_status = Faker::Address.city
  B_illing_validation_Account_N =  name_status + " " + time + " " + title
  @browser.text_field(:id => 'billingcycle-create-name').set B_illing_validation_Account_N
  sleep 2
  @browser.text_field(:id =>'billingcycle-create-default-day').set "22" # inser billing cycle
end

Then(/^Click the Save Button for Insert billing$/) do
@browser.button(:id => 'billingcycle-create-save').click
end

And(/^Delete a previuosly  created billing cycle$/) do
  title = "Sensus Automation Test"
  @browser.text_field(:class => 'form-control input-sm').set title
  @browser.button(:class => 'btn btn-default menu-row-delete').click
  sleep 2
  @browser.button(:id => 'billingcycle-delete-confirm').click
end

Then(/^Click Event Type$/) do
  sleep 2
  @browser.send_keys :tab, :tab ,:tab,:tab,:tab ,:tab,:tab ,:tab ,:tab ,:tab ,:tab
  @browser.send_keys :enter
end

Then(/^Enter Event Type Name$/) do
  title = "Sensus Automation Test"
  time = Time.now.strftime("%d/%m/%Y %H:%M")
  name_status = Faker::Address.city
  Event_Type_validation_Account_N =  name_status + " " + time + " " + title
  @browser.text_field(:id => 'event-type-create-name').set Event_Type_validation_Account_N
  sleep 1
  @browser.text_field(:id => 'event-type-create-name').set title
  sleep 1
  @browser.text_field(:id => 'event-type-create-name').set title
  sleep 1
  @browser.select_list(:id => 'event-type-create-level').select 'Any' # Level
  sleep 1
  @browser.select_list(:id => 'event-type-create-category').select 'Any' # Level
   end

Then(/^Click the Save Button for Event Type$/) do
@browser.button(:id => 'event-type-create-save').click
end

Then(/^Click Event Types$/) do
  sleep 2
  @browser.button(:id => 'create-event-type-btn').click
  end

Then(/^click the Utility  Icon$/) do
sleep 2
@browser.element(:xpath => '/html/body/div/nav/div[2]/div/ul/li[13]/a').click
end

Then(/^click Create New Utility$/) do
sleep 1
@browser.element(:xpath => '/html/body/div/div/div[2]/div/div/div/div[1]/div[1]/button').click
end

Then(/^enter Name of utility$/) do
  utility_name = Faker::Company.name
  @browser.text_field(:id => 'utility-detail-info-name-text').when_present.set utility_name
end

Then(/^Enter Description$/) do
utility_desc = Faker::Address.street_address
@browser.text_field(:id => 'utility-detail-info-description-text').when_present.set utility_desc
end

And(/^Enter Conmmodities selection$/) do
@browser.option(:value => 'GAS').select
  end

Then(/^enter email address$/) do
utility_email = Faker::Internet.email
@browser.text_field(:id => 'utility-detail-info-email-text').when_present.set utility_email
end

Then(/^Input path$/) do
@browser.text_field(:id => 'utility-detail-info-input-path-text').when_present.set 'ceal'
end

And(/^enter Home URL$/) do
@browser.text_field(:id => 'utility-detail-info-home-url-text').when_present.set 'https://ceal-dev1.gridasasservice.com'
end

Then(/^enter DB Name$/) do
@browser.text_field(:id => 'utility-detail-info-db-name-text').when_present.set 'veerdeeco_ceal_db'
end