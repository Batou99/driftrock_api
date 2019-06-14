require_relative '../test_helper'

describe TotalSpend do
  let(:email) { "robert.paulson@fightclub.com" }
  let(:data) do
    [
      OpenStruct.new(user_id: 1, item: "a", total: 1),
      OpenStruct.new(user_id: 1, item: "a", total: 1),
      OpenStruct.new(user_id: 1, item: "b", total: 1)
    ]
  end

  it "returs the total expenditure for user" do
    Purchase.expects(:where).with(user_id: 1).returns(data)
    User.expects(:where).with(email: email).returns([User.new(id: 1)])
    assert_equal 3, TotalSpend.run(email)
  end

  it "returns nil if the user is not found" do
    User.expects(:where).with(email: "foo@bar.com").returns([])
    assert_equal nil, TotalSpend.run("foo@bar.com")
  end

  it "returns zero if the user has not purchased anything" do
    User.expects(:where).with(email: "foo@bar.com").returns([User.new(id: 2)])
    assert_equal 0, TotalSpend.run("foo@bar.com")
  end
end
