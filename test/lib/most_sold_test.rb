require_relative '../test_helper'

describe MostSold do
  let(:data) do
    [
      OpenStruct.new(item: "a", total: 1),
      OpenStruct.new(item: "a", total: 1),
      OpenStruct.new(item: "b", total: 1)
    ]

  end
  before do
    Purchase.expects(:all).returns(data)
  end

  it "returs the most sold item name" do
    assert_equal "a", MostSold.run
  end
end
