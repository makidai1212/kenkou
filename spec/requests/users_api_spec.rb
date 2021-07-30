require 'rails_helper'

RSpec.describe "UsersApi", type: :request do
  # paramsで送り込むデータを以下とするみたいなやつ
  let(:params){ 
                { name: "foo",
                  email: "foo@bar.com",
                  password: "foobar", 
                  password_confirmation: "foobar"
            }
          }

  # setup的なやつ。事前に登録画面に移動するってやつ
  before do
    get signup_path
  end
  # Usersコントローラーのcreateアクションの動き？
  describe "users#<create>" do
    # postデータの受け取りができること
    it "postデータの受け取りができること" do
      # letで作ったデータを受け取らせてみる
      post users_path, params: { user: params}
      # postリクエストをちゃんと受け取っているかの確認
      expect(response).to have_http_status(302)
    end
  end
end