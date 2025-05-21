module Admin
  class ProductsController < ApplicationController
    layout "admin"

    def index
      @products = product_service.list_products
    end

    def new
      @product = Product.new
      @categories = Category.all
    end

    def create
      @product = product_service.create_product(product_params, params[:product][:images])
      if @product.persisted?
        redirect_to admin_products_path, notice: "Product was successfully created."
      else
        @categories = Category.all
        render :new
      end
    end

    def edit
      @product = product_service.get_product(params[:id])
      @categories = Category.all
    end

    def update
      @product = product_service.update_product(params[:id], product_params, params[:product][:images])
      if @product.errors.empty?
        redirect_to admin_products_path, notice: "Product was successfully updated."
      else
        @categories = Category.all
        render :edit
      end
    end

    def show
      @product = product_service.get_product(params[:id])
    end

    def disable
      product_service.disable_product(params[:id])
      redirect_to admin_products_path, notice: "Product was successfully disabled."
    end

    def enable
      product_service.enable_product(params[:id])
      redirect_to admin_products_path, notice: "Product was successfully enabled."
    end

    def destroy
      product_service.delete_product(params[:id])
      redirect_to admin_products_path, notice: "Product was successfully deleted."
    end

    private

    def product_service
      @product_service ||= ProductService.new
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :active, :category_id)
    end
  end
end
