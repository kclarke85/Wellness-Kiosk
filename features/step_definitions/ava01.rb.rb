Given(/^Verify The Rest System is connected and active$/) do
  require "uri"
  require "net/http"

  url = URI("https://api.covid19api.com/dayone/country/south-africa/status/confirmed")
  https = Net::HTTP.new(url.host, url.port);
  https.use_ssl = true
  request = Net::HTTP::Get.new(url)
  response = https.request(request)

  File.open("file_json_complete.json", "w") do |response|
    response.each do |n|
      response.write(n.to_json)




  puts response.read_body
      end

end
end