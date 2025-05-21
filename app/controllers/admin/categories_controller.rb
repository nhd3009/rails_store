module Admin
    class CategoriesController < ApplicationController
        layout "admin"

        def index
            @categories = category_service.list_categories
        end

        def show
            @category = category_service.get_category(params[:id])
        end

        def new
            @category = Category.new
        end

        def create
            @category = category_service.create_category(category_params)
            if @category.persisted?
            redirect_to admin_category_path(@category), notice: "Category was successfully created."
            else
            render :new
            end
        end

        def edit
            @category = category_service.get_category(params[:id])
        end

        def update
            @category = category_service.update_category(params[:id], category_params)
            if @category.errors.empty?
            redirect_to admin_category_path(@category), notice: "Category was successfully updated."
            else
            render :edit
            end
        end

        def destroy
            category_service.delete_category(params[:id])
            redirect_to admin_categories_path, notice: "Category was successfully deleted."
        end

        def disable
            category_service.disable_category(params[:id])
            redirect_to admin_categories_path, notice: "Category was successfully disabled."
        end

        def enable
            category_service.enable_category(params[:id])
            redirect_to admin_categories_path, notice: "Category was successfully enabled."
        end

        private

        def category_service
            @category_service ||= CategoryService.new
        end

        def category_params
            params.require(:category).permit(:name, :description, :active)
        end
    end
end
