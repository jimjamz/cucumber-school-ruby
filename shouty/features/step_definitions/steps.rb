require "shouty"

# before hook, to create the network instance for every scenario
Before do
  @network = Shouty::Network.new
  @people = {}
end

# Given('a person named {person}') do |person|

# end

Given('a person named {word}') do | name |
  @people[name] = Shouty::Person.new(@network)
end

Given('Lucy is located/standing {int} metre(s) from Sean') do |distance|
  @people['Lucy'].move_to(distance)
end
    
When('Sean shouts {string}') do |message|
  @people['Sean'].shout(message)
  @message_from_sean = message
end

Then("{word} hears Sean's message") do | name |
  expect(@people[name].messages_heard).to include @message_from_sean
end
