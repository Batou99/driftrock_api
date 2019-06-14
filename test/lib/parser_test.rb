require_relative '../test_helper'

describe Parser do
  let(:parser) { Parser.new(args) }
  describe Parser::MOST_SOLD do
    before do
      command_klass.expects(:run)
    end

    let(:args) { [Parser::MOST_SOLD] }
    let(:command_klass) { MostSold }

    it "calls MostSold.run" do
      parser.parse!
    end
  end

  describe Parser::TOTAL_SPEND do
    let(:email) { "robert.paulson@fightclub.com" }
    let(:args) { [Parser::TOTAL_SPEND, email] }
    let(:command_klass) { TotalSpend }

    it "calls TotalSpend.run(email)" do
      command_klass.expects(:run).with(email)
      parser.parse!
    end

    it "shows usage if no email" do
      command_klass.expects(:run).never
      parser = Parser.new([Parser::TOTAL_SPEND])
      parser.expects(:usage)
      parser.parse!
    end
  end

  describe Parser::MOST_LOYAL do
    before do
      command_klass.expects(:run)
    end

    let(:args) { [Parser::MOST_LOYAL] }
    let(:command_klass) { MostLoyal }

    it "calls MostLoyal.run" do
      parser.parse!
    end
  end

  describe "wrong params" do
    it "shows usage if params is empty" do
      parser = Parser.new([])
      parser.expects(:usage)
      parser.parse!
    end

    it "shows usage if params are wrong" do
      parser = Parser.new(["foo", "bar"])
      parser.expects(:usage)
      parser.parse!
    end
  end
end
