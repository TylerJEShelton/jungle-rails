require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validates all fields are filled" do
      @user = User.create(f_name: "Tyler", l_name: "Shelton", email: "t@t.com", password: "Test1234", password_confirmation: "Test1234")
      expect(@user).to be_valid
    end

    it "validates that f_name (First Name) is not present" do
      @user = User.create(f_name: nil, l_name: "Shelton", email: "t@t.com", password: "Test1234", password_confirmation: "Test1234")
      expect(@user.f_name).to be_nil
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end

    it "validates that l_name (Last Name) is not present" do
      @user = User.create(f_name: "Tyler", l_name: nil, email: "t@t.com", password: "Test1234", password_confirmation: "Test1234")
      expect(@user.l_name).to be_nil
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end

    it "validates that email is not present" do
      @user = User.create(f_name: "Tyler", l_name: "Shelton", email: nil, password: "Test1234", password_confirmation: "Test1234")
      expect(@user.email).to be_nil
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "validates that passwords do not match" do
      @user = User.create(f_name: "Tyler", l_name: "Shelton", email: "t@t.com", password: "Test1234", password_confirmation: "Test12345678")
      expect(@user).to be_invalid
    end

    it "validates that passwords are not present" do
      @user = User.create(f_name: "Tyler", l_name: "Shelton", email: "t@t.com", password: nil, password_confirmation: nil)
      expect(@user.password).to be_nil
      expect(@user.password_confirmation).to be_nil
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "validates that password is shorter than 8 characters" do
      @user = User.create(f_name: "Tyler", l_name: "Shelton", email: "t@t.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it "validates that the email already exists" do
      @user1 = User.create(f_name: "Tyler", l_name: "Shelton", email: "t@t.com", password: "Test1234", password_confirmation: "Test1234")

      @user2 = User.create(f_name: "Theo", l_name: "Smith", email: "t@t.com", password: "Test1234", password_confirmation: "Test1234")
      expect(@user2).to be_invalid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
end
