# /spec/models/devtool_spec.rb
require "rails_helper"

describe Devtool do
  it "is valid with valid attributes" do
    user = FactoryGirl.create(:user, id: 1)
    devtool = Devtool.new(title: "Anything", body: "Literally anything at all", user_id: user.id)
    expect(devtool).to be_valid
  end
  binding.pry
  it "is not valid with non-valid attributes" do
    devtool1 = Devtool.new(title: "Anything", body: "" )
    devtool2 = Devtool.new(title: "", body: "Literally anything at all" )
    devtool3 = Devtool.new(title: "", body: "" )
    devtool4 = Devtool.new(title: "Anything", body: "Literally anything at all")
    expect(devtool1).to_not be_valid
    expect(devtool2).to_not be_valid
    expect(devtool3).to_not be_valid
    expect(devtool4).to_not be_valid
  end

end
