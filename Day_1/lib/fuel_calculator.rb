class FuelCalculator

  def fuel_for_mass(mass)
    (mass / 3) - 2
  end

  def fuel_for_mass_with_fuel(mass)
    mass_of_fuel = fuel_for_mass(mass)
    calculate_fuel_for_mass_with_fuel(mass_of_fuel)
  end

  def sum_of_fuel(list_of_mass)
    list_of_mass.reduce(0) { |sum, mass| sum + fuel_for_mass(mass) }
  end
  
  def sum_of_fuel_with_fuel(list_of_mass)
    list_of_mass.reduce(0) { |sum, mass| sum + fuel_for_mass_with_fuel(mass) }
  end

  private

  def calculate_fuel_for_mass_with_fuel(mass)
    if mass <= 0
      0
    else
      mass = mass + calculate_fuel_for_mass_with_fuel(fuel_for_mass(mass))
    end
  end
end