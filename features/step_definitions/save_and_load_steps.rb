Given(/^I have a save file "(.*?)" with "(.*?)" as current room$/) do |save_file, room|
  save = YAML.load_file("games/#{save_file}")
  save["current_room"] = room.to_sym

  File.open("saves/#{save_file}", 'w') { |f| f.write(save.to_yaml) }
end

Then(/^save file "(.*?)" should have '(.*?)' as current room$/) do |save_file, expected_room|
  save = YAML.load_file("saves/#{save_file}")

  save['current_room'].should == expected_room
end
