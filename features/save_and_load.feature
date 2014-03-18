Feature: Saving and loading
  In order to not lose my progress
  As a player
  I want to be able to save and load the game

  Scenario: initial save game from start room
    Given I start the game "adventure_cave"
     When I choose "Start new game"
     Then save file "adventure_cave.yaml" should have 'start' as current room

  Scenario: have last last location as current room
    Given I start the game "adventure_cave"
     When I choose "Start new game"
      And I choose "Enter"
      And I choose "Continue south"
     Then save file "adventure_cave.yaml" should have 'room2' as current room

  @wip
  Scenario: continue game from last saved location
    Given I have a save file "adventure_cave.yaml" with 'room3' as current room
      And I start the game "adventure_cave"
     When I choose "Continue"
     Then I should be in room "Study" with description "Small study."
