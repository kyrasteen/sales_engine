require 'csv'
require_relative 'customer_parser'

class CustomerRepo

  attr_reader :data, :filename, :se_self

  def initialize(filename, se_self)
    @filename = filename
    @data = customers_parser.parse
    @se_self = se_self
  end

  def customers_parser
    @customers_parser ||= CustomerParser.new(filename, self)
  end

  def all
    data
  end

  def find_random
    data.sample
  end

  def random
    data[find_random]
  end

  def find_by_id(id)
    find_by_attribute(:id, id.to_s)
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

  def find_invoices(customer_id)
    se_self.invoice_repository.find_all_by_customer_id(customer_id)
  end

  private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
