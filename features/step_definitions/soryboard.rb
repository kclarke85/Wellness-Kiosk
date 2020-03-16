require 'clipboard'

Given(/^Play Slideshow$/) do
system 'C:\Ruby\slideshow\run_slide.bat'
end

And(/^Play introduction 101_Demo$/) do
  system 'C:\Ruby\TTS\balcon\DCRP.bat'
end

And(/^intro$/) do # Play article 1 female voice
  Dash_intro = File.read('c:\Ruby\TTS\balcon\voice.txt')
#puts Dash_intro
  Clipboard.copy Dash_intro
#puts clipboard.past
  system 'C:\Ruby\TTS\balcon\balcon.bat'
  sleep 20
  end

 Then(/^play male voice with second article$/) do # Play article two male voice
Dash_intro2 = File.read('c:\Ruby\TTS\balcon\voice2.txt')
Clipboard.copy Dash_intro2
#puts clipboard.past
 system 'c:\Ruby\balcon.bat'
   sleep 2
  end