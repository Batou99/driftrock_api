require 'activeresource'

class Entity < ActiveResource::Base
  self.include_format_in_path = false
  self.site = "https://driftrock-dev-test.herokuapp.com"

  class << self
    # We need to hack this because the API does not support querying
    def where(options)
      all.select do |e|
        attributes = e.attributes
        attributes.merge(options) == attributes
      end
    end
  end
end
