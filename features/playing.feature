Feature: Playing
  In order to have fun
  As a player
  I want to start a new adventure

  Scenario: starting a game
    Given I go to the main page 
    When I start a game
    Then I have the question "What is your name, adventurer?"
