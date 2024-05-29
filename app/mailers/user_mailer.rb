class UserMailer < ApplicationMailer
  def product_created_email
    @greeting = "Hi"
    @product = params[:product]

    mail(to: @product.user.email, subject: "Product registered")
  end
end
