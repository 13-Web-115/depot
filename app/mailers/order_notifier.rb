class OrderNotifier < ActionMailer::Base
  default from: "Sam Ruby <depot@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
  
  def shipProducts(order, line_items)
    @order = order
    @line_items = line_items
    mail to: order.email, subject: 'Pragmatic Store Order Products Shipped'
  end
end
