require 'csv'
require_relative 'items_parser'

class ItemsRepo
  
  attr_reader :data, :filename

  def initialize(filename, se_self)
    @filename = filename
    @data = items_parser.parse
  end

  def items_parser
    @items_parser ||= ItemsParser.new(filename, self)
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

  def find_by_name(name)
    find_by_attribute(:name,name)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_by_description(description)
    find_by_attribute(:description, description)
  end

  def find_by_unit_price(unit_price)
    find_by_attribute(:unit_price, unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by_attribute(:merchant_id, merchant_id)
  end

  def find_all_by_description(description)
    find_all_by_attribute(:description, description)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_attribute(:unit_price, unit_price)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_attribute(:merchant_id, merchant_id)
  end

  private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
