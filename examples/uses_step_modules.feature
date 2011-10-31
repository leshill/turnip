Feature: A simple feature using step modules (Use) extension
  Use ferocious_attack

  Scenario: This is a simple feature using load
    Given there is a monster
    When I attack it ferociously
    Then it should die
