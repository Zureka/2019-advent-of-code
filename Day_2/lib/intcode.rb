class Intcode
  attr_reader :opcode, :first_arg_pos, :second_arg_pos, :store_pos

  def initialize(ints)
    @opcode = ints[0]
    @first_arg_pos = ints[1]
    @second_arg_pos = ints[2]
    @store_pos = ints[3]
  end
end
