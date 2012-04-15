require 'spec_helper'

describe Ingredient do

  it "returns first name if main is not set" do
    i = Factory.create(:ingredient,
                       names:  2.times.map { Factory.create(:ingredient_name) }
                      )
    i.name.should == i.names.first.name
  end

  it "returns main name if main is set to true" do
    i = Factory.create(:ingredient_with_names)
    p i.names
    i.name.should == i.names.where(main: true).first.name
  end

  it "accepts names as nested attributes" do
    i = Factory.create( :ingredient,
                        names_attributes: [
                          { name: "E421" },
                          { name: "E435" }
                        ]
                      )
    i.names.map(&:name).should == ["E421", "E435"]
  end
end
