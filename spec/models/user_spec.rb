require 'rails_helper'

RSpec.describe User, type: :model do
  
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

end
