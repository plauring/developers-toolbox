require 'rails_helper'

describe User do
  let!(:user) {User.create(name: "partybody200", email:"2hard2party@example.com", password:"123qwe" )}
  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid with non-valid attributes" do
    expect(User.create(name: "", email: "2hard2party@example.com", password: "123qwe" )).to_not be_valid
    expect(User.create(name: "partybody200", email: "", password: "123qwe" )).to_not be_valid
    expect(User.create(name: "partybody200", email: "2hard2party@example.com", password: "" )).to_not be_valid
  end

  it "has a matching password confirmation for the password" do
    user2 = User.new
    user2.password = 'password'
    user2.password_confirmation = 'anotherpassword'

    expect(user2).to_not be_valid
    expect(user2.errors[:password_confirmation]).to_not be_blank
  end
end
