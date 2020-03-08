require 'Watir'
require 'cucumber'
#require 'watir-webdriver'
require 'selenium-webdriver'
require 'rubygems'
#require'rspec/expectations'
require 'rspec'


#USERS = YAML.load_file("Users/keclarke/ruby193/GP/proj-Data.yml")
#require 'rake'
#desc 'Run Cucumber features and generate an HTML summary, JUnit XML and a plain text log'
#
#Cucumber::Rake::Task.new(:features) do |t|
#
#  t.cucumber_opts =
#      "--no-color"
#      "--format junit    -o log/",
#      "--format html     -o log/features.html",
#      "--format pretty"]

TEST_DATA_DIR = "./features/test_data"
if ENV["HEADLESS"]
  INDEX_OFFSET = 0
  WEBDRIVER = false
else

  #ie = Watir::Browser.new :ie
  #firefox = Watir::Browser.new :firefox
  #chrome = Watir::Browser.new :chrome
  #opera = Watir::Browser.new :opera

#  require 'selenium/webdriver'
#url = "http://#{ENV['kevinclarke2']}:#{ENV['5AyLAPWXEESrJLd3kCM9']}@hub.browserstack.com/wd/hub"
#capabilities = Selenium::WebDriver::Remote::Capabilities.new
#  capabilities['os'] = ENV['BS_AUTOMATE_OS']
#  capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
#  capabilities['browser'] = ENV['SELENIUM_BROWSER']
#  capabilities['browser_version'] = ENV['SELENIUM_VERSION']
#  capabilities['browserstack.debug'] = "true"
#capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
#capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']
#browser = Selenium::WebDriver.for(:remote, :url => url,
#:desired_capabilities => capabilities)
#Before do |scenario|
 # @browser = browser
 #end
# at_exit do
#    browser.quit
#  end

end



