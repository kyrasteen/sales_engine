require 'csv'
require_relative 'invoice_items'

class InvoiceItemsParser

  attr_reader :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @se_self = se_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      InvoiceItems.new(line, se_self)
    end
  end

end
