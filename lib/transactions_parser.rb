require 'csv'
require_relative 'transactions'

class TransactionsParser
  attr_reader :filename, :tr_self

  def initialize(filename, tr_self)
    @filename = filename
    @tr_self = tr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    @transactions = file.map do |line|
      Transactions.new(line, tr_self)
    end
  end
end
