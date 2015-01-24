require_relative 'merchants_repo'
require_relative 'customers_repo'
require_relative 'invoice_items_repo'
require_relative 'invoices_repo'
require_relative 'items_repo'
require_relative 'transactions_repo'


class SalesEngine

  def startup
    customers_repository
    invoice_items_repository
    invoices_repository
    items_repository
    transactions_repository
    merchants_repository
  end

  def merchants_repository(filename = './data/merchants.csv')
    @merchants_repository ||= MerchantsRepo.new(filename, self)
  end

  def customers_repository(filename = './data/customers.csv')
    @customers_repository ||= CustomersRepo.new(filename, self)
  end

  def invoice_items_repository(filename = './data/invoice_items.csv')
    @invoice_items_repository ||= InvoiceItemsRepo.new(filename, self)
  end

  def invoices_repository(filename = './data/invoices.csv')
    @invoices_repository ||= InvoicesRepo.new(filename, self)
  end

  def items_repository(filename = './data/items.csv')
    @Items_repository ||= ItemsRepo.new(filename, self)
  end

  def transactions_repository(filename = './data/transactions.csv')
    @transactions_repository ||= TransactionsRepo.new(filename, self)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    invoices_repository.find_all_by_merchant_id(merchant_id)
  end

end
