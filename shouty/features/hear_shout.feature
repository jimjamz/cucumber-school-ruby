Feature: Hear shout

  Shouty allows users to "hear" other users "shouts" as long as 
  they are close enough to each other.
  In order to send location-sensitive messages to people nearby
  As a shouter
  I want to broadcast messages to people near me

  To-do:
    - Only shout to people within a certain distance
    - people remember everything they've heard
    - max length of message is 180 characters

  Background:
    Given the range is 100
    And the following people:
      | name     | Sean | Lucy | Larry |
      | location | 0    | 100  | 150   |

  Scenario: Listener is within range
    When Sean shouts "Free bagels!"
    Then Lucy hears Sean's message

  Scenario: Listener is out of range
    When Sean shouts "Free bagels!"
    Then Larry does not hear Sean's message

  Scenario: Two shouts
    When Sean shouts "Free bagels!"
    And Sean shouts "Free toast!"
    Then Lucy hears the following messages:
      | Free bagels! |
      | Free toast!  |

  Scenario: Message is too long
    When Sean shouts:
      """
      This is a really long message
      so long in fact that I am not going to
      be allowed to send it, at least if I keep
      typing like this until the length is over
      the limit of 180 characters.
      """
    Then nobody hears Sean's message
