# frozen_string_literal: true

def while_loop(number)
  while number < 10
    puts number
    number += 1
  end
end

def until_loop(number)
  until number == 10 # Negative of while like if-unless
    puts number
    number += 1
  end
end

# rubocop:disable Metrics/MethodLength
def loop_to5(number)
  loop {
    if number.even?
      number += 1
      next # Same as continue in other languages
    elsif number == 5
      puts 'Reached 5'
      break
    else
      puts 'Odd number'
      number += 1
    end
  }
end
# rubocop:enable Metrics/MethodLength

def loop_to3
  # Ruby for loop with a range
  3.times do |i|
    # Alternative to curly brace block
    puts "Iteration #{i + 1}"
  end
end

if __FILE__ == $PROGRAM_NAME
  number = 1

  puts 'While loop ->'
  while_loop(number)

  puts "\nUntil loop ->" # Escape sequences do not work with single quotation
  until_loop(number)

  puts "\nIterative block ->"
  three_numbers = [1, 2, 3]
  p(three_numbers.map.with_index { |n, index| n * index })

  puts
  loop_to5(1)

  puts
  loop_to3
end
