require 'active_support'
require 'active_support/core_ext'
require_relative '../models/purchase'
require_relative '../models/user'

class TotalSpend
  def self.run(email)
    User.where(email: email).first&.purchases&.sum(&:total)
  end
end
