require 'csv'
require_relative 'merchants'

class MerchantsParser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Merchants.new(line, nil)
    end
  end

end
