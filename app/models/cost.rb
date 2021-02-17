class Cost < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' },
  ]
  include ActiveHash::Associations
  has_many :items
  

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :cost_id, numericality: { other_than: 2 } 
end
