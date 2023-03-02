require 'shouty'

describe Person do
  let(:sean) { Person.new(network, 0) }
  let(:lucy) { Person.new(network, 100) }
  let(:network) { double.as_null_object }

  it "subscribes to the network" do
    expect(network).to receive(:subscribe)
    location = 7 # can be anything at this point
    new_person = Person.new(network, location)
  end

  it "has a location" do
    expect(lucy.location).to eq 100
  end

  it "broadcasts shouts to the network" do
    message = "Free bagels!"
    expect(network).to receive(:broadcast).with message, sean.location
    sean.shout message
  end

  it "remembers messages heard" do
    message = "Free bagels!"
    location = 1750 # location is not taken into account here
    larry = Person.new(network, location)
    larry.hear(message)
    expect(larry.messages_heard).to eq [message]
  end

end
