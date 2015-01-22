require 'csv'
require_relative 'repository'
require "pry"

class TransactionsRepo
  attr_reader :filename, :data

  def initialize(filename)
    @filename = filename
    @data = load_data
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

  def find_by_attribute(attribute,criteria)
    data.each_with_index do |row, index|
      if row[attribute] == criteria.to_s
        return data[index]
      end
    end
  end

end
