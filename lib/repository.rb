class Repository

  def all
   
  end

end



 def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_created_at(created_at)
    find_by_attribute(:created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_attribute(:updated_at, updated_at)
  end