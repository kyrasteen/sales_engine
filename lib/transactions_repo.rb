require 'csv'
require_relative 'transactions_parser'

class TransactionsRepo
  
  attr_reader :data, :filename

  def initialize(filename, se_self)
    @filename = filename
    @data = transactions_parser.parse
  end

  def transactions_parser
    @transactions_parser ||= TransactionsParser.new(filename, self)
  end

  def all
    data
  end

  def random
    data[find_random]
  end

  def find_random
    record = rand(0..data.length)
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

  def find_by_invoice_id(invoice_id)
    find_by_attribute(:invoice_id, invoice_id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_attribute(:invoice_id, invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)
    find_by_attribute(:credit_card_number, credit_card_number)
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by_attribute(:credit_card_number, credit_card_number)
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    find_by_attribute(:credit_card_expiration_date, credit_card_expiration_date)
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    find_all_by_attribute(:credit_card_expiration_date, credit_card_expiration_date)
  end

  def find_by_result(result)
    find_by_attribute(:result, result)
  end

  def find_all_by_result(result)
    find_all_by_attribute(:result, result)
  end

  private

  def find_by_attribute(attribute,criteria)
    data.find { |row| row.send(attribute) == criteria }
  end

  def find_all_by_attribute(attribute, criteria)
    data.find_all { |row| row.send(attribute) == criteria }
  end

end
