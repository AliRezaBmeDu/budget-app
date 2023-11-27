class Buy < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :buys_categories
    has_many :categories, through: :buys_categories
    validates :name, presence: true
    validates :amount, presence: true
end
