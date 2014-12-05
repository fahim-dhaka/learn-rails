require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # A user goes to the index page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.

  test "buying a product" do
   LineItem.delete_all
   Order.delete_all
   ruby_book = products(:autoparts)
  
   #A user goes to the index page.
   get "/"
   assert_response :success
   assert_template "index"
  
   #HE select a product
   xml_http_request :post, '/line_items', product_id: ruby_book.id
   assert_response :success 
    
   cart = Cart.find(session[:cart_id])
   assert_equal 1, cart.line_items.size
   assert_equal ruby_book, cart.line_items[0].product

   #Then he checked out
   get "/orders/new"
   assert_response :success
   assert_template "new"

   #the user has to fill in their details on the checkout form. Once
   #  he do and post the data, our application creates the order and redirects
   #  to the index page.
   post_via_redirect "/orders",
                      order: { name:     "Dave Thomas",
                               address:  "123 The Street",
                               email:    "dave@example.com",
                               pay_type: "Check" }
   assert_response :success
   assert_template "index"
   cart = Cart.find(session[:cart_id])
   assert_equal 0, cart.line_items.size
 
   #we’ll wander into the database and make sure we’ve created an order
   #  and corresponding line item and that the details they contain are correct
   mail = ActionMailer::Base.deliveries.last
   assert_equal ["dave@example.com"], mail.to
   assert_equal 'Fahim Ahmed <depot@example.com>', mail[:from].value
   assert_equal "Dholaikhal.com Order Confirmation", mail.subject  
  
  end

end
