#spec/models/review_spec.rb
require "rails_helper"

describe Review do
  it "is valid with valid attributes" do
    devtool1 = Devtool.new(id: 1, title: "Anything", body: "Literally anything at all" )

    if devtool1.save
      expect(Review.new(title: "Title1", body: "Body1", rating: 2, devtool_id: devtool1.id)).to be_valid
    end
  end

  it "is not valid with non-valid attributes" do
    devtool1 = Devtool.new(id: 1, title: "Anything", body: "Literally anything at all" )

    if devtool1.save
      expect(Review.new(title: "", body: "Body1", rating: 3, devtool_id: 1)).to_not be_valid
      expect(Review.new(title: "Title1", body: "Body1", rating: "a", devtool_id: 1)).to_not be_valid
      expect(Review.new(title: "Title1", body: "", rating: 5, devtool_id: "")).to_not be_valid
      expect(Review.new(title: "Title1", body: "Body1", rating: 10, devtool_id: "")).to_not be_valid
      expect(Review.new(title: "Title1", body: "Body1", rating: "", devtool_id: "")).to_not be_valid
    end
  end
end
