require 'rails_helper'

describe Item do
  let(:user){create(:user)}
  let(:category){create(:category)}
  let(:item){create(:item, user_id: user.id, category_id: category.id)}
    describe 'item#create' do
    it "商品名,説明,カテゴリー,商品状態,発送料の負担,発送元地域,発送までの日数,金額が存在すれば登録できること" do
      expect(item).to be_valid
    end
  end
end