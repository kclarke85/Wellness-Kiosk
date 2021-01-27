require 'rubygems'
require "uri"
require "net/http"
require 'file/utils'

Given(/^get data$/) do
url = URI("https://covidtracking.com/api/states")
https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true
request = Net::HTTP::Get.new(url)
response = https.request(request)
puts response.read_body

  end

Given(/^Goto landing page$/) do

end

Given(/^Connect to Mongo CLuster$/) do
require 'mongo'
#db = Mongo::Connection.new.db("mydb") # OR
#  db = Mongo::Connection.new("localhost").db("mydb") # OR
  db = Mongo::Connection.new("localhost", 27017).db("kipaj")
end

Given(/^Run mitigation for thirty minutes$/) do
  while true

  system "c:\\ruby\\sounds\\dec_sound.bat"
  sleep 60
  system "c:\\ruby\\onbond.bat"
  system "TaskKill.exe /IM WMPlayer.exe"
  sleep 60
  system "c:\\ruby\\sounds\\clossing_sound.bat"
  sleep 30
  system "c:\\ruby\\offbond.bat"

  end

  end

