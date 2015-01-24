require 'csv'
require_relative 'customers_parser'

class CustomersRepo
  attr_reader :data, :filename, :sales_engine

  def initialize(filename, sales_engine)
    @filename = filename
    @sales_engine = sales_engine
    @data = customers_parser.parse
  end

  def customers_parser
    @customers_parser ||= CustomersParser.new(filename, self)
  end

  def all
    data
  end

  def find_random
    rand(0..data.length)
  end

  def random
    data[find_random]
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_all_by_id(id)
    find_all_by_attribute(:id, id)
  end

  def find_by_created_at(time)
    find_by_attribute(:created_at, time)
  end

  def find_all_by_created_at(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_by_updated_at(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_updated_at(time)
    find_all_by_attribute(:updated_at, time)
  end

  def find_by_first_name(first_name)
    find_by_attribute(:first_name, first_name)
  end

  def find_all_by_first_name(first_name)
    find_all_by_attribute(:first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_by_attribute(:last_name, last_name)
  end

  def find_all_by_last_name(last_name)
    find_all_by_attribute(:last_name, last_name)
  end

  private
  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
