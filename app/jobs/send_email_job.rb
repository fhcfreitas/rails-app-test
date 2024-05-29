class SendEmailJob < ApplicationJob
  queue_as :mailers

  def perform(product_id)
    product = Product.find(product_id)
    user = product.user
    UserMailer.product_created_email(user, product).deliver_now
  end
end
