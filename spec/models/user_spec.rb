require 'rails_helper'

RSpec.describe User, type: :model do

  # setupみたいな感じ
  before do
    @user = FactoryBot.build(:user)
  end
  
  it "ユーザー登録は可能である" do
    expect(build(:user)).to be_valid
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

  it "同じemailは登録できない" do
    @user.save
    duplicate_user = @user.dup
    expect(duplicate_user).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  it "パスワードは最低6文字でなければ登録できない" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to_not be_valid
  end
  
  # パスワードも省略して書ける
  describe 'passwordのバリデーション' do
    it 'passwordの存在性' do
      user = build(:user, password: '')
      expect(user).to_not be_valid
    end
  end

  # 違うバリデーションテストの書き方
  describe 'validations' do
    it '名前が空白は無効' do
    is_expected.to validate_presence_of(:name) 
    end
    # 以下 it に続く部分を省略している
    it { is_expected.to validate_presence_of(:email) }
    # パスワードの確認はできないらしい
    # it { is_expected.to validate_presence_or(:password) }
    it { is_expected.to validate_length_of(:name).is_at_most(50)}
    it { is_expected.to validate_length_of(:email).is_at_most(255)}
    it '正しいフォーマットのemailが有効' do
      is_expected.to allow_values('USER@foo.COM',
                                  'THE_US-ER@foo.bar.org',
                                  'first.last@foo.jp').for(:email)
    end
    it '間違ったフォーマットのemailが無効' do
      is_expected.to_not allow_values('user@example,com',
                                      'user_at_foo.org',
                                      'user.name@example.',
                                      'foo@bar_baz.com foo@bar+baz.com').for(:email)
      end
  end
  describe 'validate uniqueness of email' do
    # @user.save的な？
    let!(:user) { create(:user, email: 'foo@example.com') }
    it '同じemailは登録できない' do
      user = build(:user, email: 'foo@example.com')
      expect(user).to_not be_valid
    end
    it '大文字小文字の違いでも登録できない' do
      user = create(:user, email: 'Foo@example.com')
      expect(user).to_not be_valid
    end
  end

  describe 'before_save' do
    describe 'email_downcase' do
      let!(:user) { create(:user, email: 'FOO@example.com')}
      it '小文字で保存されているはず' do
        expect(user.reload.email).to eq 'foo@example.com'
      end
    end
  end
end
