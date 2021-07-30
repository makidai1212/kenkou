require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end
  end

  describe "error message check" do
    # cat't be blank のエラーメッセージを返すで
    it "return can't be blank" do
      # 空データでuserを作成しようとする
      user = User.new()
      user.valid?
      # エラーメッセージ「can't be blank」を含むエラーメッセージが出ることが予測される
      expect(user.errors.messages[:name]).to include("can't be blank")
    end
  end

end
