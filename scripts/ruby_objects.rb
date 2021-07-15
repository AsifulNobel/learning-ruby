# frozen_string_literal: true

# Get an empty object
empty_object = Object.new

# Add a method to an object on the fly!
def empty_object.talk
  puts 'An empty object!'
end

empty_object.talk

# Returns a value without explicit return keyword
def empty_object.return_one
  1
end

puts empty_object.return_one
