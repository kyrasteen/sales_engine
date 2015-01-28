require 'csv'
require_relative 'customer'

class CustomerParser

  attr_reader :filename, :cr_self

  def initialize(filename, cr_self)
    @filename = filename
    @cr_self = cr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Customer.new(line, cr_self)
    end
  end

end
