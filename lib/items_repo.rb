require 'csv'
require_relative 'items_parser'

class ItemsRepo
  attr_reader :data, :items_parser 

  def initialize(filename)
    @items_parser = ItemsParser.new(filename)
    @data = items_parser.parse
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
    data.each_with_index do |row, index|
      if row.send(attribute) == criteria
        return data[index]
      end
    end
  end

  def find_all_by_attribute(attribute, criteria)
    all_found = []
    data.each_with_index do |row, index|
      if row.send(attribute) == criteria
        all_found << data[index]
      end
    end
    all_found
  end
end
