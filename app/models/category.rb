class Category < ApplicationRecord
    attr_accessor :total
    has_many :buys_categories
    has_many :buys, through: :buys_categories
    validates :name, presence: true
end
