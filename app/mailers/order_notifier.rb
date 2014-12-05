class OrderNotifier < ActionMailer::Base
  default from: 'Fahim Ahmed <depot@example.com>'                             #PR179
            
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #

  #PR181
  def received (order)
    @order = order

    mail to: order.email, subject: 'Dholaikhal.com Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  #PR182
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Dholaikhal.com Order Shipped'
  end
end
