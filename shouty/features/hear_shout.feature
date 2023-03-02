Feature: Hear shout

  Shouty allows users to "hear" other users "shouts" as long as 
  they are close enough in to each other.

  To-do:
    - Only shout to people within a certain distance

  Background: 
    Given a person named Lucy
    And a person named Sean

  Rule: Shouts can be heard by other users
    Scenario Outline: Listener hears a message
      # And Lucy is located 15 metres from Sean
      When Sean shouts "<message>"
      Then Lucy hears Sean's message
      | message |
      | Free bagels at Sean's |
      | Free coffee! |

    Scenario: Listener is within range

    Scenario: Listener is out of range
            