require 'rails_helper'

RSpec.describe Category, type: :model do

  let!(:category) do
    Category.create(name: 'Cloth',
                  icon: 'cloth.jpg')
  end
  describe 'Validations' do
    it 'is not valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is not valid without a icon' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many buys' do
      expect(category.buys_categories).to be_empty
    end

    it 'has many buys through buys_categories' do
      expect(category.buys).to be_empty
    end
  end

end
