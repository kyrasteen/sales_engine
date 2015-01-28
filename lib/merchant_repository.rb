require 'csv'
require_relative 'sales_engine'
require_relative 'merchant_parser'

class MerchantRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @se_self = se_self
    @filename = filename
    @data = merchants_parser.parse
  end

  def merchants_parser
    @merchants_parser ||= MerchantParser.new(filename, self)
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
    find_by_attribute(:name, name)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_items(merchant_id)
    se_self.item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoices(merchant_id)
    se_self.invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def most_revenue(number)
    # most_revenue(x) returns the top x merchant instances ranked by total revenue
    #for each merchant find total revenue
    #sort merchants by revenue
    #reverse
    #take top x
    data.sort_by { ||}
  end


private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
