require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Tom', email: 'tom@example.com', password: '123456')
      @category = Category.create(name: 'Cloth', icon: 'cloth.jpg')
      @buy = Buy.create(name: 'Shirt', amount: 60.5, category_ids: [@category.id], author_id: @user.id)
    end

    it 'has a name' do
      expect(@buy.name).to eq('Shirt')
    end

    it 'has amount' do
      expect(@buy.amount).to eq(60.5)
    end

    it 'belongs to a user' do
      expect(@buy.author_id).to eq(@user.id)
    end

    it 'belongs to at least one id' do
      expect(@buy.category_ids).to eq([@category.id])
    end
  end
end
