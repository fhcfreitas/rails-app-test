class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :show ]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def home
    @products = Product.page(params[:page]).per(10);
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      mail = UserMailer.with(product: @product).product_created_email
      mail.deliver_now
      redirect_to product_path(@product), notice: "Product listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product updated", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: "Product deleted", status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
