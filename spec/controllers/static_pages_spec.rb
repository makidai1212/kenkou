require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    context 'homeの場合' do
      it "returns http success" do
        get :home
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status 200
        expect(response).to render_template :home
      end
    end
    context 'aboutの場合' do
      it "returns http success" do
        get :about
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status 200
        expect(response).to render_template :about
      end
    end
    context 'contactの場合' do
      it "returns http success" do
        get :contact
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status 200
        expect(response).to render_template :contact
      end
    end
  end

end