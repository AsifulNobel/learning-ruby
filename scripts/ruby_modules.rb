# frozen_string_literal: true

require_relative 'ruby_classes'

# Contains methods to convert prices
module USDPriceConverter
  def to_bdt(usd_price)
    usd_price * 84.77
  end
end

class ConcertTicket
  # module mixin
  include USDPriceConverter
end

# Test module
module M
  def report
    puts 'M'
  end
end

# Test class
class C
  include M

  # Overrides report method of M
  def report
    puts 'C'
  end
end

# Class with prepended mixin
class E
  prepend M

  # Fails to override report method of M
  def report
    puts 'E'
  end
end

# Test sub-class
class D < C
  # Overrides report method of C
  def report
    puts 'D'
  end
end

# Test sub-class
class F < E
  # Overrides report method of M
  def report
    puts 'F'
  end
end

# Class with extended mixin
class G
  extend M
end

if __FILE__ == $PROGRAM_NAME
  coldplay_ticket = ConcertTicket.new('Coldplay', 'EURO 2020')
  coldplay_ticket.price = 150

  puts coldplay_ticket.to_bdt(coldplay_ticket.price)

  d_object = D.new
  d_object.report # D

  f_object = E.new
  f_object.report # M

  f_object = F.new
  f_object.report # F

  p D.ancestors # [D, C, M, Object, Kernel, BasicObject]
  p E.ancestors # [M, E, Object, Kernel, BasicObject]
  p F.ancestors # [F, M, E, Object, Kernel, BasicObject]

  G.report # M
  p G.ancestors # M module is not included
end
