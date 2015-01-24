class Merchants

  attr_reader :id, :name, :created_at, :updated_at, :mr_self

  def initialize(line, mr_self)
    @id = line[:id].to_i
    @name = line[:name]
    @created_at = line[:created_at]
    @updated_at = line[:updated_at]
    @mr_self = mr_self
  end

  def items
    mr_self.merchants_repository.find_all_by_id(id)
  end

  def invoices
    mr_self.merchants_repository.find_all_by_id(id)
  end

end
