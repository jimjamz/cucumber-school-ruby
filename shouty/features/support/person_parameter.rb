require "shouty"

# DSL method from Cucumber
ParameterType(
# the name used in the the curly brackets, within the step definitions.
    name:        'person',
# the regular expression that the parameter will match to.
    regexp:       /Lucy|Sean/,
# the value returned that is matached by the above regular expression,
# and passed to the step definition.
# this will pass an instance of Person into our step definition/
    transformer: -> (name) { Shouty::Person.new(name) }
)