require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthday
      が存在すれば登録できる" do

      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "passwordが空では登録できない" do

      end
    end
  end
end