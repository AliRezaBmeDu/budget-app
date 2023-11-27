class Buy < ApplicationRecord
    belongs_to :category
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    validates :name, presence: true
    validates :amount, presence: true
end
