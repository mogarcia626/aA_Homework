require 'rspec'
require 'dessert'


=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("moustafa") }
  subject(:pudding) {Dessert.new('pudding', 3, chef)}

  describe "#initialize" do

    it "sets a type" do
    expect(pudding.type).to eq('pudding')
    end

    it "sets a quantity" do
    expect(pudding.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
    expect(pudding.ingredients).to eq([])
    end

    it "sets the initial oven dessert temperature to 60 degrees" do
    expect(pudding.temp).to eq(60)
    end


    it "raises an argument error when given a non-integer quantity" do
    expect{ Dessert.new('pudding', "three", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pudding.ingredients).to_not include('almonds')
      pudding.add_ingredient('almonds')
      expect(pudding.ingredients).to include('almonds')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['almonds', 'pistachios', 'milk', 'chocolate', 'sugar']
      ingredients.each { |ing| pudding.add_ingredient(ing) }

      expect(pudding.ingredients).to eq(ingredients)
      pudding.mix!
      expect(pudding.ingredients).not_to eq(ingredients)
      expect(pudding.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pudding.eat(3)
      expect(pudding.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {pudding.eat(4)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Moustafa the Great Baker")
      expect(pudding.serve).to eq("Chef Moustafa the Great Baker has made 3 puddings!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(pudding)
      pudding.chef.bake(pudding)
      pudding.make_more
      expect(pudding.temp).to eq(400)
    end
  end
end
