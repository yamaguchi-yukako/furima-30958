class Order < ApplicationRecord
has_one :shippingaddress
belongs_to :user
belongs_to :item
end