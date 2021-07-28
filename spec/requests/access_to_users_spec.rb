describe 'POST #create' do
  context '有効なユーザーの検証' do
    it 'ユーザーが追加されると' do
      expect do
        # post signup_path, params: { user: ~} 的なやつ
        post signup_path, params: { user: attributes_for(:user) }
      # assert_diffrence, User.count,1 do 的なやつ
      end.to chenge(User, :count).by(1)
      end
    end

    # ユーザーが追加されたときの検証
    context 'ユーザーが追加されたとき' do
      before { post signup_path, params: { user: attributes_for(:user) } }
      subject { response }
      it { is_expected.to redirect_to user_path(User.last) }
      it { is_expected.to have_http_status 302 }
    end
  end
end