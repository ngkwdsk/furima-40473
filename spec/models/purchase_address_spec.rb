require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
		sleep(1)
  end
  describe '商品購入' do
		context '購入できる場合' do
			it 'カード情報、有効期限、セキュリティコード、郵便番号、市区町村、番地、電話版番号が存在すれば購入できる' do
				expect(@purchase_address).to be_valid
			end
			it '建物名が空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
		end
		context '購入できない場合' do
			it '郵便番号が空では購入できない' do
				@purchase_address.post_code = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
			end
			it '郵便番号にハイフンがないと購入できない' do
				@purchase_address.post_code = '1234567'
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
			end
			it '都道府県が空では購入できない' do
				@purchase_address.region_id = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
			end
			it '都道府県に「---」が選択されている場合は購入できない' do
				@purchase_address.region_id = 1
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
			end
			it '市区町村が空では購入できない' do
				@purchase_address.city = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("City can't be blank")
			end
			it '市区町村が全角以外では購入できない' do
				@purchase_address.city = 'ABCDEF'
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("City must be full-width characters")
			end
			it '番地が空では購入できない' do
				@purchase_address.block = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
			end
			it '電話番号が空では購入できない' do
				@purchase_address.phone = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
			end
			it '電話番号に「-」があると購入できない' do
				@purchase_address.phone = '090-1234-5678'
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Phone is invalid. Enter it as follows (e.g. 09012345678)")
			end
			it '電話番号が半角数字以外だと購入できない' do
				@purchase_address.phone = '０９０１２３４５６７８'
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Phone is invalid. Enter it as follows (e.g. 09012345678)")
			end
			it 'カード番号が空では購入できない' do
				@purchase_address.token = ''
				@purchase_address.valid?
				expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
			end
		end
	end
end