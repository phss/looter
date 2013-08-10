Feature: Playing
  In order to have fun
  As a player
  I want to start a new adventure

  Scenario: starting a new game
    Given I start a sample game
      And I am asked the question "What is your name, adventurer?"
     When I answer "Spartacus"
     Then I am in room "Entrance"
