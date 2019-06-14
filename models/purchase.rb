require_relative 'entity'

class Purchase < Entity
  def user
    User.where(id: user_id).first
  end

  def total
    spend.to_f
  end
end
