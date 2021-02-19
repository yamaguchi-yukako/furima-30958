class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture_code
  belongs_to :day

  with_options presence: true do
    validates :name
    validates  :price, numericality:{ only_integer: true}
    validates :info
    validates :category_id
    validates :condition_id 
    validates :cost_id 
    validates :prefecture_code_id
    validates :day_id
  end
  
  
  validates  :price, numericality: {greater_than: 299, less_than: 10000000}
#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, numericality: { other_than: 0 } 
        #ジャンルの選択が「--」の時は保存できないようにする
        validates :condition_id, numericality: { other_than: 0 } 
          #ジャンルの選択が「--」の時は保存できないようにする
  validates :cost_id, numericality: { other_than: 0 }
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :day_id, numericality: { other_than: 0 }
      #ジャンルの選択が「--」の時は保存できないようにする
  validates :prefecture_code_id, numericality: { other_than: 0 }
end
  
