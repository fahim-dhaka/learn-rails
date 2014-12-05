class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]                #PR164 
  has_many :line_items, dependent: :destroy
  
  validates :name, :address, :email, presence: true                           #PR166
  validates :pay_type, inclusion: PAYMENT_TYPES                               #

  def add_line_items_from_cart(cart)                                          #PR169
    cart.line_items.each do |item|                                            #
      item.cart_id = nil                                                      #
      line_items << item                                                      #
    end                                                                       #
  end                                                                         #
end