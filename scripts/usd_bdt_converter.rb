usd_bdt_conversion_rate = 84.77

print "Enter USD Amount -> "

user_input = gets
usd = user_input.to_i
bdt = usd * usd_bdt_conversion_rate

puts "#{usd} USD = #{bdt} BDT"