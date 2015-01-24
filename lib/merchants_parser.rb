
require 'csv'
require_relative 'merchants'

class MerchantsParser

  attr_reader :filename, :mr_self

  def initialize(filename, mr_self)
    @filename = filename
    @mr_self = mr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    @merchants = file.map do |line|
      Merchants.new(line, mr_self)
    end
  end

end
