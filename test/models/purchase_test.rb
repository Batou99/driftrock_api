require_relative '../test_helper'

describe "Purchase" do
  describe ".where" do
    it "finds by all its attributes" do
      purchase = Purchase.first

      purchase.attributes.each do |k, v|
        assert Purchase.where(k => v).include?(purchase)
      end
    end

    it "returns [] if not found" do
      assert_equal [], Purchase.where(id: "fake")
    end
  end

  describe "#user" do
    before do
      @purchase = Purchase.first
    end

    it "navigates the relation right" do
      assert_equal @purchase.user_id, @purchase.user.id
    end
  end
end

