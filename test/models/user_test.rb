require_relative '../test_helper'

describe "User" do
  describe ".where" do
    it "finds by all its attributes" do
      user = User.first
      user.attributes.each do |k, v|
        assert_equal [user], User.where(k => v)
      end
    end

    it "returns [] if not found" do
      assert_equal [], User.where(email: 1)
    end
  end

  describe "#purchases" do
    before do
      @user = User.first
    end

    it "navigates the relation right" do
      assert_equal [@user.id], @user.purchases.map(&:user_id).uniq
    end
  end
end

