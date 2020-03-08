Given(/^Log into SQMonitor$/) do
@browser ||= Watir::Browser.new :firefox
@browser.goto "https://sqmediator.telchemy.com:26010/"
end

require 'fileutils'
Then(/^Enter User ID$/) do
  @browser.text_field(:class => 'logininput').wait_until_present.set 'kclarke'
end

And(/^Enter Password$/) do
 @browser.text_field(:id => 'j_password').wait_until_present.set 'mKnhNDM8!'
end

Then(/^Click the login button$/) do
  @browser.button(:type => 'submit').click
end

Then(/^Escape from the popup window$/) do
@browser.send_keys :escape
end

And(/^Verify the Dashboard functionality$/) do
dashboard_current = @browser.div(id: 'chart-area').text.strip
#puts  dashboard_content
#sleep 10
File.open('c:\ruby\telchemy\data\dashboard_view_baseline_current.txt', 'w') { |file| file.write(dashboard_current) }

 dashboard_baseline = File.read('c:\ruby\telchemy\data\dashboard_view_baseline.txt')

 sleep 3

require 'file_compare'

  FileCompare.compare_files(dashboard_baseline , dashboard_current)

 if  ans = true
      put "101_Dashboard_View_Smoke_Test  Failed"

 else put "101_Dashboard_View_Smoke_Test Passed"

 end

    end


And(/^now$/) do
  system 'C:\sleep.bat'
  @browser.send_keys :space
end