require 'csv'
require "pry"

class TransactionsRepo 
  attr_reader :filename, :data 

  def initialize(filename)
    @filename = filename
  end

  def load_data
    rows = CSV.open(filename, headers:true, header_converters: :symbol)
    @data = rows.map do |row|
      row 
      end
    data
  end

  def all
    data
  end

  def random
    record = rand(0..data.length)
    data[record]
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_attribute(attribute,criteria )
    data.find_all { |datum| datum.to_s.downcase == criteria.to_s.downcase }
  end



end
