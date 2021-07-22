# frozen_string_literal: true

def more_than_100?(number)
  if number > 100
    puts 'More than 100'
  elsif number == 100
    puts 'Equals to 100'
  else
    puts 'Less than 100'
  end
  # Mandatory keyword to end the if block
end

def less_than_90?(number)
  puts 'Less than 90' unless number > 90 # Means if not
end

if __FILE__ == $PROGRAM_NAME
  print 'Enter a number: '
  given = gets.to_i

  more_than_100? given
  less_than_90? given
end
