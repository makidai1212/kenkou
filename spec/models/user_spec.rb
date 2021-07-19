require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "ユーザー登録は可能である" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:user, name: '')).to_not be_valid
  end

  it "名前が51文字以上だと登録できない" do
    expect(FactoryBot.build(:user, name: "a" * 51)).to_not be_valid
  end

  it "emailがなければ登録できない" do
    expect(FactoryBot.build(:user, email: '')).to_not be_valid
  end

  it "emailが256文字以上だと登録できない" do
    expect(FactoryBot.build(:user, email: "a" * 256)).to_not be_valid
  end

  it "emailが正規表現だと登録できる" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        expect(FactoryBot.create(:user, email: valid_address.inspect)).to be_valid
      end
  end

  it "emailが正規表現ジャなかったら登録できない" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        expect(FactoryBot.create(:user, email: invalid_address.inspect)).to_not be_valid
      end
  end

end
