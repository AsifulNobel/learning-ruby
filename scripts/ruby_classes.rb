# frozen_string_literal: true

# A class to represent a ticket
class Ticket
  attr_accessor :price # Syntactic sugar to add reader and writer methods

  def initialize(occasion)
    @occasion = occasion
  end

  def print_price
    puts @price
  end

  # Class method
  def self.most_expensive(*tickets)
    tickets.max_by(&:price)
  end
end

# Reopens class to add method
class Ticket
  def print_occasion
    puts @occasion
  end
end

# Concert ticket modeling class
class ConcertTicket < Ticket
  # Inherits Ticket
  attr_reader :band_name

  LINEUP = %w[Disturbed Mudvayne].freeze
  # %w outputs the array in comma separated quoted way
  # Freezing the constant makes in immutable, because Ruby constants are mutable

  def initialize(band_name, occasion)
    super(occasion)
    @band_name = band_name
  end
end

# Checks if script is run using commandline
if __FILE__ == $PROGRAM_NAME # $PROGRAM_NAME is a Global variable
  disturbed_ticket = ConcertTicket.new('Disturbed', 'Concert A')
  disturbed_ticket.price = 100

  disturbed_ticket.print_price
  disturbed_ticket.print_occasion
  puts disturbed_ticket.band_name

  selena_ticket = ConcertTicket.new('Selena Gomez', 'Concert S')
  selena_ticket.price = 150

  puts Ticket.most_expensive(selena_ticket, disturbed_ticket).price
  p ConcertTicket::LINEUP
end
