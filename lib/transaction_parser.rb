require 'csv'
require_relative 'transaction'

class TransactionParser
  attr_reader :filename, :tr_self

  def initialize(filename, tr_self)
    @filename = filename
    @tr_self = tr_self
  end

  def parse
    file = CSV.open(filename, :headers => true, :header_converters => :symbol)
    @transactions = file.map do |line|
      Transaction.new(line, tr_self)
    end
  end
end
