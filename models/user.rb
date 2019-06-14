require_relative 'entity'

class User < Entity
  def purchases
    Purchase.where(user_id: id)
  end
end
