require 'active_support'
require 'active_support/core_ext'
require_relative '../models/purchase'

class MostSold
  def self.run
    Purchase
      .all
      .group_by(&:item)
      .map { |key, values| [key, values.sum(&:total)] }
      .to_h
      .max_by { |_, v| v }[0]
  end
end
