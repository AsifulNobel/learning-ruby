def read_from_file(filename)
  # Initializing empty string like this due to frozen string literal directive
  content = String.new

  # File handle is auto-closed, when block ends
  File.open(filename, 'r') do |handle|
    # Reading file content this way, buffers file content instead of reading it in one go
    handle.each_with_index { |line, index| content << "Line #{index + 1}: #{line}" }
  end

  content
end

def write_to_file(filename, content)
  File.open(filename, 'w') do |handle|
    handle.write(content)
  end
end

if __FILE__ == $PROGRAM_NAME
  content = read_from_file('data/dummy_text1.txt')

  puts content
  write_to_file('data/dummy_output1.txt', content)
end
