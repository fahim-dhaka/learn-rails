class StoreController < ApplicationController
  skip_before_action :authorize                   #PR203
  include CurrentCart                             #PR139
  before_action :set_cart
  def index
  	  @products = Product.order(:title)
  end
end


