require 'spec_helper'

describe User do
  
  before do
   @user = User.new(name: "Me", email: "me@oleg.com", password: "foobar", password_confirmation: "foobar", client_id: 1, tel1: "123456789012", tel2: "123456789098") 
  end
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:client_id) }
  it { should respond_to(:tel1) }
  it { should respond_to(:tel2) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "with short password" do
    before { @user.password = @user.password_confirmation = "a"*5 }
  end

  describe "with tel1 too short" do
    before { @user.tel1 = "1"*11 }
    it { should_not be_valid }
  end
  describe "with tel1 too long" do
    before { @user.tel1 = "1"*13 }
    it { should_not be_valid }
  end


  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do 
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "when password is blank" do
    before do
      @user = User.new(name: "Me", email: "me@oleg.com", password: " ", password_confirmation: " ", client_id: 1, tel1: "123456789012", tel2: "123456789098") 
    end
    it { should_not be_valid }
  end

  describe "password does not match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end


  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
  end
  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end
  describe "when tel1 is not present" do
    before { @user.tel1 = " " }
    it { should_not be_valid }
  end
  describe "when tel2 is not present" do
    before { @user.tel2 = " " }
    it { should_not be_valid }
  end
  describe "when company is not present" do
    before { @user.client_id = nil }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |inv_adr| 
        @user.email = inv_adr
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+p@baz.cn]
      addresses.each do |val_adr|
        @user.email = val_adr
        expect(@user).to be_valid
      end
    end
  end

  describe "when tel1 format is not valid" do
    it "should not be valid" do
      @user.tel1 = "qw2345763wer"
      expect(@user).not_to be_valid
    end
  end

  describe "when tel1 format is valid" do
    it "should be valid" do
      @user.tel1 = "123456789098"
      expect(@user).to be_valid
    end
  end
end
