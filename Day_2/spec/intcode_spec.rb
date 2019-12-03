require "intcode"

RSpec.describe Intcode do
  context "#initialize" do
    it "initializes values properly" do
      intcode = Intcode.new([1, 10, 20, 30])
      expect(intcode.opcode).to eq(1)
      expect(intcode.first_arg_pos).to eq(10)
      expect(intcode.second_arg_pos).to eq(20)
      expect(intcode.store_pos).to eq(30)
    end
  end
end