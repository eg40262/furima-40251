require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  it "emailが存在すれば登録できること" do
    @user.email = "a@b"
    expect(@user).to be_valid
  end

  it "emailが一意でないと登録できないこと" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it "emailに@が含まれていないと登録できないこと" do
    @user.email = "test.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it "nickname, email, password, password_confirmationが存在すれば登録できること" do
    expect(@user).to be_valid
  end

  it "passwordが空では登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordが6文字以上でないと登録できないこと" do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "last_nameが空では登録できないこと" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it "first_nameが空では登録できないこと" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it "last_name_kanaが空では登録できないこと" do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it "first_name_kanaが空では登録できないこと" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it "birth_dateが空では登録できないこと" do
    @user.birth_date = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end
end
