
require 'csv'
require_relative 'merchants'

class MerchantsParser

  attr_reader :filename, :se_self, :merchants

  def initialize(filename, se_self)
    @filename = filename
    @se_self = se_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    @merchants = file.map do |line|
      Merchants.new(line, se_self)
    end
  end

end
