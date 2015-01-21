require 'csv'
require_relative 'transactions'

class TransactionsParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      Transactions.new(line, nil)
    end
  end
end