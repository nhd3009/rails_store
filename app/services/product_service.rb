class ProductService
    def initialize(repository = ProductRepository.new)
        @repository = repository
    end

    def list_products
        @repository.all
    end

    def get_product(id)
        @repository.find(id)
    end

    def create_product(params, images)
        @repository.create_with_images(params, images)
    end

    def update_product(id, params, images)
        @repository.update_with_images(id, params, images)
    end

    def delete_product(id)
        @repository.destroy(id)
    end

    def disable_product(id)
        @repository.disable(id)
    end

    def enable_product(id)
        @repository.enable(id)
    end

    def remove_product_image(product_id, image_id)
        @repository.remove_image(product_id, image_id)
    end

    def search_products(query)
        @repository.search_products(query)
    end

    def get_products_by_category(category_id)
        @repository.products_by_category(category_id)
    end

    def get_low_stock_products(threshold = 10)
        @repository.products_with_low_stock(threshold)
    end

    def get_products_in_price_range(min_price, max_price)
        @repository.products_in_price_range(min_price, max_price)
    end
end
