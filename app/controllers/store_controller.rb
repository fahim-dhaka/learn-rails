class StoreController < ApplicationController
  include CurrentCart                             #PRAG139
  before_action :set_cart
  def index
  	  @products = Product.order(:title)
  end
end


