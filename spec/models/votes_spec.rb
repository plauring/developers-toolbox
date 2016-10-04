# /spec/models/votes_spec.rb
require "rails_helper"

describe Review do
  it "is valid with valid attributes" do
    user1 = User.new(id: 1, name: "Russ", email: "toys@russ.com", encrypted_password: "123asdf")
    devtool1 = Devtool.new(id: 1, title: "Anything", body: "Literally anything at all" )
    review1 = Review.new(title: "Title1", body: "Body1", rating: 2, devtool_id: devtool1.id)

    if user1.save && review1.save && devtool1.save
      expect(Votes.new(user_id: user1.id, review_id: review1.id)).to be_valid
    end
  end
end
