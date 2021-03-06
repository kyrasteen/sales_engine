require 'csv'
require_relative 'invoice_item'

class InvoiceItemParser

  attr_reader :filename, :mr_self

  def initialize(filename, mr_self)
    @filename = filename
    @mr_self = mr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      InvoiceItem.new(line, mr_self)
    end
  end

end
