require 'rails_helper'

describe CreditCard do
  let(:user){create(:user)}
  let(:credit_card){create(:credit_card, user_id: user.id)}
  describe '#create' do
    it "customer_idとcard_idが存在すれば登録できること" do
      expect(credit_card).to be_valid
    end
  end
end
