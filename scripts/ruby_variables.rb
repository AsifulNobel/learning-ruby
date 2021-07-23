def change_string_to_tsundere(input_string)
  input_string.replace('tsundere') # frozen string error
  input_string
end

hello = 'hello'

begin
  puts change_string_to_tsundere(hello)
rescue FrozenError
  puts "Frozen error - hello: #{hello}"
end

# Trying duplication
hello = 'hello'
puts "Without error - hello:#{change_string_to_tsundere(hello.dup)}" # No frozen error
puts "hello: #{hello}"

# Ruby first checks if a identifier is a keyword.
# Then if it is a local variable.
# Then if it is a method call.
