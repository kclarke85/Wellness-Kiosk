require 'clipboard'
require 'rubygems'

Given(/^Play Slideshow$/) do
system 'C:\Ruby\slideshow\run_slide.bat'
system 'C:\Ruby\TTS\balcon\DCRP.bat'
end

And(/^intro$/) do # Play article 1 female voice
Dash_intro = File.read('c:\Ruby\TTS\balcon\voice.txt')
#puts Dash_intro
Clipboard.copy Dash_intro
#puts clipboard.past
Clipboard.clear
  system 'C:\Ruby\TTS\balcon\balcon.bat'
  sleep 55
  #system  'taskkill /f /im balcon.exe'
end



Then(/^update Dashboard$/) do
  require 'rubygems'
  require 'jira-ruby'

  options = {
      :username     => 'kclarke',
      :password     => 'Tuesday19@@',
      :site         => 'http://radon.telchemy.com:8080',
      :context_path => '',
      :auth_type    => :basic
  }

  client = JIRA::Client.new(options)

  project = client.Project.find('SQprobe')

  project.issues.each do |issue|
    puts "#{issue.id} - #{issue.summary}"
  end

end


Given(/^Search the web by topic$/) do

require 'ruby-web-search'
 true
 response = RubyWebSearch::Google.search(:query => "Natalie Portman")
response.
    puts response
end