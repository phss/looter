Feature: Saving and loading
  In order to not lose my progress
  As a player
  I want to be able to save and load the game

  Scenario: initial save game from start room
    Given I start the game "adventure_cave.yaml"
     When I choose "Start new game"
     Then save file "save_adventure_cave.yaml" should have 'start' as current room

  Scenario: have last last location as current room
    Given I start the game "adventure_cave.yaml"
     When I choose "Start new game"
      And I choose "Enter"
      And I choose "Continue south"
     Then save file "save_adventure_cave.yaml" should have 'room2' as current room
