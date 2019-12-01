require "fuel_calculator"

RSpec.describe FuelCalculator do
  before do
    @subject = FuelCalculator.new
  end

  context "#fuel_for_mass" do
    it "calculates the fuel for a mass of 12" do
      expect(@subject.fuel_for_mass(12)).to eq(2)
    end

    it "calculates the fuel for a mass of 14" do
      expect(@subject.fuel_for_mass(14)).to eq(2)
    end

    it "calculates the fuel for a mass of 1969" do
      expect(@subject.fuel_for_mass(1969)).to eq(654)
    end

    it "calculates the fuel for a mass of 100756" do
      expect(@subject.fuel_for_mass(100756)).to eq(33583)
    end
  end

  context "#fuel_for_mass_with_fuel" do
    it "returns 2 for a mass of 12" do
      expect(@subject.fuel_for_mass_with_fuel(12)).to eq(2)
    end

    it "returns 2 for a mass of 14" do
      expect(@subject.fuel_for_mass_with_fuel(14)).to eq(2)
    end

    it "returns 966 for a mass of 1969" do
      expect(@subject.fuel_for_mass_with_fuel(1969)).to eq(966)
    end

    it "returns 50346 for a mass of 100756" do
      expect(@subject.fuel_for_mass_with_fuel(100756)).to eq(50346)
    end
  end

  context "#sum_of_fuel" do
    it "returns 0 if no mass is given" do
      expect(@subject.sum_of_fuel([])).to eq(0)
    end

    it "returns 2 if only 12 is given for list of mass" do
      expect(@subject.sum_of_fuel([12])).to eq(2)
    end

    it "returns 4 if 12 and 14 are given for list of mass" do
      expect(@subject.sum_of_fuel([12, 14])).to eq(4)
    end
  end
end
