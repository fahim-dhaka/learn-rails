class AddPriceToLineItem < ActiveRecord::Migration
  def change
      add_column :line_items, :price, :decimal             #PR133: E1

      LineItem.all.each do |li|
        li.update_attribute :price, li.product.price
      end

  end
end
