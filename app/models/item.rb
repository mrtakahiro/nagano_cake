class Item < ApplicationRecord
   has_one_attached :item_image

   # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.10).round
    end
end

