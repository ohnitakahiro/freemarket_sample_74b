require 'rails_helper'
describe Address do
  describe 'registrations#create_address' do

    it "post_codeが空欄の場合、登録できないこと" do
      address = FactoryBot.build(:address, post_code: "" )
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end

    it "post_codeが7文字ではない、登録できないこと" do
      address = FactoryBot.build(:address, post_code: "000000" )
      address.valid?
      expect(address.errors[:post_code]).to include("は7文字で入力してください")
    end

    it "post_codeが数字ではない、登録できないこと" do
      address = FactoryBot.build(:address, post_code: "ttttttt" )
      address.valid?
      expect(address.errors[:post_code]).to include("は数値で入力してください")
    end

    it "prefecturesが空欄の場合、登録できないこと" do
      address = FactoryBot.build(:address, prefectures: "" )
      address.valid?
      expect(address.errors[:prefectures]).to include("を入力してください")
    end

    it "cityが空欄の場合、登録できないこと" do
      address = FactoryBot.build(:address, city: "" )
      address.valid?
      expect(address.errors[:city]).to include("を入力してください") 
    end

    it "blockが空欄の場合、登録できないこと" do
      address = FactoryBot.build(:address, block: "" )
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

    it "phone_numberが数字ではない、登録できないこと" do
      address = FactoryBot.build(:address, phone_number: "ttttttt" )
      address.valid?
      expect(address.errors[:phone_number]).to include("は数値で入力してください")
    end
  end
end
