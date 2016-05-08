#!/usr/bin/env ruby
# coding:utf-8

require './main.rb'

bot = Bot.new

begin
  bot.timeline.userstream do |status|

    twitter_id = status.user.screen_name
    name = status.user.name
    contents = status.text
    status_id = status.id


      if contents =~ /^@hoge\s*/
        if contents =~ /eject/
          system('eject')
          bot.fav(status_id:status_id)
        end
      end
    sleep 2
  end

rescue => em
  puts Time.now
  p em
  sleep 2
  retry

rescue Interrupt
  exit 1
end
