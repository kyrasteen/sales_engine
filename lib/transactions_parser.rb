require 'csv'
require_relative 'transactions'

class TransactionsParser
  attr_reader :filename, :mr_self, :transactions

  def initialize(filename, mr_self)
    @filename = filename
    @mr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    @transactions = file.map do |line|
      Transactions.new(line, mr_self)
    end
  end
end
