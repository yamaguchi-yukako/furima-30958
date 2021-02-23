class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture_code
  belongs_to :day

  with_options presence: true do
    validates :name
    validates  :price
    validates :info
    validates :image
  end
  
  
validates :price, numericality: {greater_than: 299, less_than: 10000000}

with_options numericality: { other_than: 0 }  do
validates :category_id
validates :condition_id
validates :cost_id
validates :day_id
validates :prefecture_code_id
end
end
  
