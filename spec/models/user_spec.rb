require 'rails_helper'

RSpec.describe User, type: :model do

  # setupみたいな感じ
  before do
    @user = FactoryBot.build(:user)
  end
  
  it "ユーザー登録は可能である" do
    expect(@user).to be_valid
  end

  it "名前がなければ登録できない" do
    @user.name = " "
    expect(@user).to_not be_valid
  end

  it "名前が51文字以上だと登録できない" do
    @user.name = "a" * 51
    expect(@user).to_not be_valid
  end

  it "emailがなければ登録できない" do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "emailが256文字以上だと登録できない" do
    @user.email = "a" * 256
    expect(@user).to_not be_valid
  end

  it "emailが正規表現ジャなかったら登録できない" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        expect(FactoryBot.build(:user, email: invalid_address.inspect)).to_not be_valid
      end
  end

end
