require 'pry'
require_relative 'intcode'

def create_intcodes(list_of_commands)
  intcodes = []

  list_of_commands.each do |command|
    break if command == [99]
    intcodes << Intcode.new(command)
  end

  intcodes
end

def process_list(list)
  command = []
  list_of_commands = []
  index = 0

  loop do
    break if list.length == index 

    list_of_commands << [99] if command.empty? && list[index] == 99

    command << list[index]

    if command.length == 4
      list_of_commands << command
      command = []
    end

    index += 1
  end

  list_of_commands
end

def execute_intcodes(intcodes, list)
  intcodes.each do |code|
    first_arg = list[code.first_arg_pos]
    second_arg = list[code.second_arg_pos]
    if code.opcode == 1
      list[code.store_pos] = first_arg + second_arg
    else
      list[code.store_pos] = first_arg * second_arg
    end
  end
  list
end

def process_file(noun, verb)
  File.open("input.txt") do |file|
    result = []
    file.each do |line|
      list = line.split(",").map(&:to_i)

      list[1] = noun
      list[2] = verb

      list_of_commands = process_list(list)
      intcodes = create_intcodes(list_of_commands)
      result = execute_intcodes(intcodes, list)
    end

    if result[0] == 19690720
      puts "I found the result!"
      puts "Noun: #{noun}"
      puts "Verb: #{verb}"
      puts "Answer (100 * noun + verb): #{100 * noun + verb}"
    end
  end
end

options = (0..99).to_a

for noun in options do
  for verb in options do
    process_file(noun, verb)
  end
end
