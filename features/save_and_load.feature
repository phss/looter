Feature: Saving and loading
  In order to not lose my progress
  As a player
  I want to be able to save and load the game

  @wip
  Scenario: initial save game from start room
    Given I start the game "adventure_cave.yaml"
     When I choose "Start new game"
     Then save file "save_adventure_cave.yaml" should have 'start' as current room
