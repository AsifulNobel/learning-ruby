puts 'Reading conversion rate from file...' # Prints text to stdout

content = File.foreach('data/conversion_rate.txt').first # Reads first line from file
usd_bdt_conversion_rate = content.to_f # Casts read data to float

print 'Enter USD Amount -> '

user_input = gets # Waits to read input from user
usd = user_input.to_i # Casts user input to integer
bdt = usd * usd_bdt_conversion_rate
bdt_rounded = format('%.2f', bdt) # Rounded to 2 decimal places

puts "#{usd} USD = #{bdt_rounded} BDT"
