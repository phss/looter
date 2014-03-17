Then(/^save file "(.*?)" should have '(.*?)' as current room$/) do |save_file, expected_room|
  save = YAML.load("saves/#{save_file}")

  save['current_room'].should == expected_room
end
