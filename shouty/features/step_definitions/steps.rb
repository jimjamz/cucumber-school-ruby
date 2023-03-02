require "shouty"

# before hook, creates empty people array
Before do
  @people = {}
end

# initialise the range of the network
Given(/^the range is (\d+)$/) do |range|
  @network = Network.new(range.to_i)
end

Given(/^the following people:$/) do |table|
  table
    .transpose
    .map_column('location') { |raw_location| raw_location.to_i }
    .hashes.each do |row|
      name = row['name']
      location = row['location']
      @people[name] = Person.new(@network, location)
    end
end

Given('a person named {word} with a location of {int}') do | name, location |
  @people[name] = Shouty::Person.new(@network, location)
end
 
When('Sean shouts {string}') do |message|
  @people['Sean'].shout(message)
  @message_from_sean = message
end

When(/^Sean shouts:$/) do |message|
  @people['Sean'].shout(message)
  @message_from_sean = message
end

Then("{word} hears Sean's message") do | name |
  if name == "nobody"
    @people.values.each do | person |
      expect(person.messages_heard).to_not include @message_from_sean
    end
  else
    expect(@people[name].messages_heard).to include @message_from_sean
  end
end

Then("{word} does not hear Sean's message") do | name |
    expect(@people[name].messages_heard).to_not include @message_from_sean
end

Then("{word} hears the following messages:") do | name, expected_messages |
  person = @people[name]
  actual_messages = person.messages_heard.map { | message | [ message ] }
  expected_messages.diff!(actual_messages)
end