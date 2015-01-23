require 'csv'
require_relative 'invoices'

class InvoicesParser

  attr_reader :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @se_self = se_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Invoices.new(line, se_self)
    end
  end

end
