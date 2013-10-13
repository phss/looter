Feature: Playing
  In order to have fun
  As a player
  I want to start a new adventure

  Scenario: starting a new game
    When I start the game "adventure_cave.yaml"
    Then I should see game title "Looter"
     And I should see aventure title "Adventure Cave"
     And I should see the options
      | Start new game |
      | Exit           |
