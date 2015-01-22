require 'csv'
require_relative 'invoice_items'

class InvoiceItemsParser

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      InvoiceItems.new(line, nil)
    end
  end

end
