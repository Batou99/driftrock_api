require_relative '../test_helper'

describe MostLoyal do
  let(:email) { "robert.paulson@fightclub.com" }
  let(:data) do
    [
      OpenStruct.new(user_id: 1, item: "a", total: 1),
      OpenStruct.new(user_id: 2, item: "a", total: 1),
      OpenStruct.new(user_id: 1, item: "b", total: 1)
    ]

  end
  before do
    Purchase.expects(:all).returns(data)
    User.expects(:where).with(id: 1).returns([User.new(email: email)])
  end

  it "returs the most sold item name" do
    assert_equal email, MostLoyal.run
  end
end
