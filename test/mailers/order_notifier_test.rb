require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Dholaikhal.com Order Confirmation", mail.subject
    assert_equal ["Dave@example.org"], mail.to
    assert_equal ["fahim.dholaikhal@gmail.com"], mail.from
    assert_match /1 x Toyota Headlight/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Dholaikhal.com Order Shipped", mail.subject
    assert_equal ["Dave@example.org"], mail.to
    assert_equal ["fahim.dholaikhal@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Toyota Headlight<\/td>/, mail.body.encoded
  end

end
