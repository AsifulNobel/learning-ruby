# frozen_string_literal: true

puts 'First file'

load 'loadable.rb'

puts 'Back to first file'

load 'loadable.rb'

puts 'loaded second file again'
