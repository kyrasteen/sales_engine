require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoices'

class InvoicesTest < Minitest::Test

  def setup
    @engine = SalesEngine.new
  end

  def test_it_stores_an_id
    invoices = Invoices.new({id:1}, nil)
    assert_equal 1, invoices.id
  end

end