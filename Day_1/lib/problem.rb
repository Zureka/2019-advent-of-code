require_relative 'fuel_calculator'

File.open('input.txt') do |file|
  list_of_mass = []
  file.each do |line|
    list_of_mass << line.strip.to_i unless line.empty?
  end

  calc = FuelCalculator.new
  result1 = calc.sum_of_fuel(list_of_mass)
  result2 = calc.sum_of_fuel_with_fuel(list_of_mass)

  puts "Total fuel required: #{result1}"
  puts "Total fuel required (with fuel): #{result2}"
end