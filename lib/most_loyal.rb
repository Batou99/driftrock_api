require 'active_support'
require 'active_support/core_ext'
require_relative '../models/purchase'

class MostLoyal
  def self.run
    user_id = Purchase
              .all
              .group_by(&:user_id)
              .map { |uid, ps| [uid, ps.count] }
              .to_h
              .max_by { |_, v| }[0]

    User.where(id: user_id).first.email
  end
end
