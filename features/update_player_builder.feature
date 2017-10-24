# ../features/campaign.feature

Feature: As user I want to update my player builder

  Scenario Outline: Update the player builder
    Given I logged in at jwplayer homepage
    And I click on <location> navbar
    And I search and select <old_name> name on the player builder page
    When I change the name to <new_name>
    And I change the aspect ratio to <size>
    And I save the changes
    Then I should see my player updated to <new_name> with aspect ratio <size>

  Examples:
    | location  |       old_name      |       new_name     |  size  |
    | "Players" | "Testing Player"    | "Testing Player 2" |  "4:3" |
    | "Players" | "Testing Player 2"  | "Testing Player"   | "16:9" |