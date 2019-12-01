class FuelCalculator

  def fuel_for_mass(mass)
    (mass / 3) - 2
  end

  def sum_of_fuel(list_of_mass)
    list_of_mass.reduce(0) { |sum, mass| sum + fuel_for_mass(mass) }
  end
end