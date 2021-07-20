# frozen_string_literal: true

# Get an empty generic object
empty_object = Object.new

if empty_object.respond_to?('talk') # Checks if method exists
  empty_object.talk
else
  puts '`talk` method not defined!'
end

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

requested_object_method_name = gets.chomp # Gets user input and removes last character

# Dynamically call a method
empty_object.send(requested_object_method_name) if empty_object.respond_to?(requested_object_method_name)
