Feature: Hear shout

  Shouty allows users to "hear" other users "shouts" as long as 
  they are close enough in to each other.

  To-do:
    - Only shout to people within a certain distance

  Background: 
    Given a person named Lucy
    And a person named Sean

  Rule: Shouts can be heard by other users
    Scenario: Listener hears a message
      # And Lucy is located 15 metres from Sean
      When Sean shouts "Free bagels at Sean's"
      Then Lucy hears Sean's message

    Scenario: Listener hears a different message
      # Given Lucy is located 15 metres from Sean
      When Sean shouts "Free coffee!"
      Then Lucy hears Sean's message

    Scenario: Listener is within range

    Scenario: Listener is out of range
            