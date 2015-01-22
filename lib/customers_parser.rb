require 'csv'
require_relative 'customers'

class CustomersParser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Customers.new(line, nil)
    end
  end

end
