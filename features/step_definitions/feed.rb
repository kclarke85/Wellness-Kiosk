require 'cucumber'
require 'rubygems'

Given(/^Config feed$/) do
#TODO 1 - Set JIRA hosting type - Cloud(C) or Server/Data-center (S)
  installation_type="C"
#TODO 2 - Set API Key - Copy from QMetry-> Automation API page.
  apiKey="3804f8471fcdb3842a2bd721907c1474bcb68e6af895e7080a32b56224ef0a7487ce8f567e2fbf72d2ee739770803dc176c01b8053f18994cd111ba9f6697099d77528f1ea9be7cc1226acb3ae9e535a"
#required in QMetry Server Addon
  userCredentials="Kevin.Clarke@telchemy.com:Tuesday19@@"
#import result API url
  url="https://qtmcloud.qmetry.com/rest/api/automation/importresult"
 end

Then(/^Login$/) do
@browser ||= Watir::Browser.new :firefox
@browser.goto "https://telchemy.atlassian.net/"
end

And(/^Enter credentials$/) do
#----------------------------------------------------------------------------------------------
@browser.text_field(:id => 'username').wait_until_present.set 'Kevin.Clarke@Telchemy.com'
@browser.button(:id => 'login-submit').click
@browser.text_field(:id => 'password').wait_until_present.set 'Tuesday19@@'
@browser.button(:id => 'login-submit').click
#----------------------------------------------------------------------------------------------
end

Given(/^The user navigates to the sqmsse$/) do
@browser ||= Watir::Browser.new :firefox
@browser.goto "http://sqmsse-itb01.testlab.telchemy.com:26010/"
end

Then(/^The user enters the The enters userid$/) do
@browser.text_field(:id => 'j_username').wait_until_present.set 'adminuser'
end

And(/^The user enters the The enters password$/) do
@browser.text_field(:id => 'j_password').wait_until_present.set 'admpasswd'
end

Then(/^The user clicks the Login button$/) do
@browser.button(:value => 'Login').wait_until_present.click
end

But(/^Verify the first login Dialog$/) do
firstattempt = @browser.span(:id => 'lastlog').exist?

  if $firstattempt = true
    then puts "The user is On the correct landing page"
      else puts 'The user is not on the right page'
  end
end

And(/^Write the test result to Testrail$/) do
  require 'testrail-ruby'

  client = TestRail::APIClient.new('https://qatelchemy.testrail.io/')
  client.user = 'kevin.clarke@telchemy.com'
  client.password = 'EJnal1Mr26yZ.YONlUyt'

  #puts client.get_projects
  #puts client.get_project(1)
  #client.get_tests(1)
  #puts client.get_test("1")

 # if $firstattempt = true
 #   then
 r = client.send_post(
  'add_result_for_case/8/3',
  { :status_id => 1, :comment => 'This test worked fine!' }
 )
 puts r

    #else
    #  if $firstattempt = false

    #        then

    #    r = client.send_post(
    #        'add_result_for_case/C18',
    #        { :status_id => 4, :comment => 'This test did not work' }
    #    )
    #    puts r

    #end
  #      end

#        end

end

Given(/^launch putty$/) do

 require 'rubygems'
 require 'net/ssh'

  @hostname = "trafficgen.testlab.telchemy.com"

  @username = "root"
  @password = "sqlmon4all"
  @cmd = "root@trafficgen probe6"

 #{ }" begin
 #    ssh = Net::SSH.start(@hostname, @username, :password => @password)
 #    res = ssh.exec!(@cmd)
 #    ssh.close
 #   puts res
 # rescue
 #  puts "Passed or Failed"
 # end
  end

Given(/^Log into TestRail$/) do
@browser ||= Watir::Browser.new :firefox
@browser.goto "https://qatelchemy.testrail.io/ "
@browser.driver.manage.window.maximize
# Enter credentials

@browser.text_field(:class => 'login-input').wait_until_present.set 'Kevin.Clarke@Telchemy.com'
@browser.text_field(:id => 'password').wait_until_present.set 'EJnal1Mr26yZ.YONlUyt'
# And clikc the submit button
@browser.button(:id=>'button_primary').wait_until_present.click
$cadence = sleep 23 # Set global variable for managing  wait methids
end

And(/^Display current Release Progress$/) do
 require 'clipboard'
 DCRP_intro = File.read("c:\\Ruby\\TTS\\balcon\\DCRP.txt")
#puts Dash_intro
  Clipboard.copy DCRP_intro
#puts clipboard.past
  system 'C:\\Ruby\\Telchemy\\TTS\\balcon\\DCRP.bat'
  sleep 2
#Click Reports
 @browser.a(:href =>'index.php?/reports/overview/1').wait_until_present.click
# Click Activity Surrmary by Cases
 @browser.a(:xpath =>'/html/body/div[4]/div/div[1]/div[3]/div[1]/table/tbody/tr[3]/td[2]/a').wait_until_present.click
$cadence
end

Then(/^Display current Build Progress$/) do
  pending
end

And(/^Display Defect by Project$/) do
$cadence
# Display Agent Technologu Projects
# Display DV@attest Agent
@browser.a(:href =>'/browse/DVQA').wait_until_present.click
$cadence
@browser.send_keys :page_up
sleep 3
@browser.send_keys :page_down
$cadence

# Display Agent Technologu Projects
# Display Embiot
  @browser.goto "http://radon.telchemy.com:8080/secure/BrowseProjects.jspa"
  sleep 3
  @browser.a(:xpath =>'/html/body/div[3]/div/div/div/div[2]/div[2]/div/table/tbody/tr[2]/td[1]/a').wait_until_present.click
  $cadence
  @browser.send_keys :page_down
sleep 3
@browser.send_keys :page_up
end

Then(/^Display current testing  by build$/) do
sleep 3
@browser.goto "https://qatelchemy.testrail.io/index.php?/reports/overview/1"
sleep 3
@browser.a(:xpath =>'/html/body/div[4]/div/div[1]/div[3]/div[1]/table/tbody/tr[1]/td[2]/a').wait_until_present.click
$cadence
end

Then(/^Display defects by project$/) do
sleep 3
@browser ||= Watir::Browser.new :firefox
@browser.goto "http://radon.telchemy.com:8080/secure/BrowseProjects.jspa#all"
@browser.driver.manage.window.maximize
# Enter credentials

@browser.a(:xpath =>'//*[@id="primary"]/div/div/p[2]/a').click
sleep 3
@browser.text_field(:id =>'login-form-username').wait_until_present.set 'kclarke'
@browser.text_field(:id =>'login-form-password').wait_until_present.set 'Tuesday19@@'
# And clikc the submit button
@browser.button(:id=>'login-form-submit').wait_until_present.click
$cadence
end

Then(/^Intro$/) do
require 'clipboard'
#Dash_intro = File.read("c:\\Ruby\\TTS\\balcon\\voice.txt")
#puts Dash_intro
#Clipboard.copy Dash_intro
#puts clipboard.past
#system 'C:\Ruby\Telchemy\TTS\balcon\balcon.bat'
#sleep 2
  random_code = ['a','t','s'].sample

  puts random_code
end

Given(/^Authenticate API for charts$/) do

host_name = 'https://api.datawrapper.de/v3/me'
Kernel.system 'curl -I #{host_name}'

end

