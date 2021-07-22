# frozen_string_literal: true

module TextHandler
  class InvalidLineError < StandardError
  end
end

def line_from_file(filename, substring)
  fh = nil

  begin
    puts "Opening file, looking for #{substring}..."
    fh = File.open(filename, 'r')

    fh.each do |line|
      puts line
      raise TextHandler::InvalidLineError unless line&.include?(substring)
    end
  rescue TextHandler::InvalidLineError => e
    puts e.backtrace
    puts e.message
  ensure
    fh&.close
  end
end

if __FILE__ == $PROGRAM_NAME
  line_from_file('data/dummy_data1.txt', '8')
  line_from_file('data/dummy_data2.txt', '8')
end
