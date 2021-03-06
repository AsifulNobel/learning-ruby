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
empty_object.method(requested_object_method_name.to_sym).call if empty_object.respond_to?(requested_object_method_name)

def empty_object.args(first, second, third = 1, *all)
  # default parameter cannot be on right-side of sponge parameter
  puts first
  puts second
  puts third
  p all # outputs in array notation
end

empty_object.args(3, 4)
empty_object.args(5, 6, 7, 89, 90)
