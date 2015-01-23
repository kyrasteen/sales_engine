class Merchants

  attr_reader :id, :name, :created_at, :updated_at, :se_self

  def initialize(line, se_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @se_self = se_self
  end

  def items
    se_self.merchants_repository.find_all_by_id(id)
  end

  def invoices
    se_self.merchants_repository.find_all_by_id(id)
  end

end
