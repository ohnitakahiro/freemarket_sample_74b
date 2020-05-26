require 'rails_helper'
describe User do
  describe 'registrations#create' do

    it "nicknameが空欄の場合,登録できないこと" do
      user = FactoryBot.build(:user, nickname: "" )  
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください") #include("can't be blank")が正しい。日本語に変換されているため右のような形にしている。
    end

    it "emailが空欄の場合、登録できないこと" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailに「＠」がない場合、登録できないこと" do
      user = FactoryBot.build(:user, email: "test.gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end   

    it "重複したメールアドレスの場合、無効である" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空欄の場合、登録ができないこと"  do
      user = FactoryBot.build(:user, password: "" )
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end


    it "passwordが6文字以下の場合、登録ができないこと"  do
      user = FactoryBot.build(:user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end


    it "family_nameが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, family_name: "" )  
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, first_name: "" )  
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, family_name_kana: "" )  
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, first_name_kana: "" )  
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birthdayが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, birthday: "" )  
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end
