puts "testing require -> enter 2 to require loadable"

# Conditional file loading
require "./loadable" if gets.to_i >= 2

puts "load again maybe!"

# Won't load same file again
# Supports relative directory
require_relative "loadable"