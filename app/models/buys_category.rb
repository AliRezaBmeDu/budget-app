class BuysCategory < ApplicationRecord
  belongs_to :buy
  belongs_to :category
end
