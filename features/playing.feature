Feature: Playing
  In order to have fun
  As a player
  I want to start a new adventure

  Scenario: starting a new game
    When I start the game
    Then I should see the options
      | Start new game |
      | Exit           |
