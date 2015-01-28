require 'csv'
require_relative 'invoice'

class InvoiceParser

  attr_reader :filename, :mr_self

  def initialize(filename, mr_self)
    @filename = filename
    @mr_self = mr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Invoice.new(line, mr_self)
    end
  end

end
