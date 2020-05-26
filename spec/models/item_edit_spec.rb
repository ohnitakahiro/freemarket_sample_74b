require 'rails_helper'

RSpec.describe Item do
    describe 'item#update' do
    let(:user){create(:user)}
    let(:category){create(:category)}
    let(:item){create(:item, user_id: user.id, category_id: category.id)}  

      it "商品名,説明,カテゴリー,商品状態,発送料の負担,発送元地域,発送までの日数,金額が存在すれば登録できること" do
        expect(item).to be_valid
      end

      it "商品名が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "商品説明が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, introduction: "")
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it "商品状態が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, condition_id: "")
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it "配送料の負担が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, postage_player_id: "")
        item.valid?
        expect(item.errors[:postage_player_id]).to include("を入力してください")
      end

      it "発送元の地域が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, region_id: "")
        item.valid?
        expect(item.errors[:region_id]).to include("を入力してください")
      end

      it "発送までの日数が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, preparation_day_id: "")
        item.valid?
        expect(item.errors[:preparation_day_id]).to include("を入力してください")
      end

      it "販売価格が空欄の場合、登録できないこと" do
        item = FactoryBot.build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end
  end

  describe '#create' do
    let(:user){create(:user)}
    let(:category){create(:category)}

    it "画像がない場合、登録できないこと" do
      item_no_picture = build(:item_no_picture)
      item_no_picture.valid?
      expect(item_no_picture.errors[:images]).to include("を入力してください")
    end
  end
end
