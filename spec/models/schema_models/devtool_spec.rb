# /spec/models/devtool_spec.rb
require "rails_helper"

describe Devtool do
  it "is valid with valid attributes" do
    expect(Devtool.new(title: "Anything", body: "Literally anything at all" )).to be_valid
  end

  it "is not valid with non-valid attributes" do
    expect(Devtool.new(title: "Anything", body: "" )).to_not be_valid
    expect(Devtool.new(title: "", body: "Literally anything at all" )).to_not be_valid
    expect(Devtool.new(title: "", body: "" )).to_not be_valid
  end

end
