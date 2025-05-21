class ProductRepository < BaseRepository
    def initialize
        super(Product)
    end

    def find_by_name(name)
        find_by(name: name)
    end

    def active_products
        @model.where(active: true)
    end

    def inactive_products
        @model.where(active: false)
    end

    def products_by_category(category_id)
        @model.where(category_id: category_id)
    end

    def search_products(query)
        @model.where("name ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
    end

    def create_with_images(attributes, images)
        product = @model.new(attributes)
        images.each do |image|
          product.images.attach(image)
        end
        product.save
        product
    end

    def update_with_images(id, attributes, images)
        product = find(id)
        if product.update(attributes)
          images.each do |image|
            product.images.attach(image)
          end
        end
        product
    end

    def remove_image(product_id, image_id)
        product = find(product_id)
        image = product.images.find(image_id)
        image.purge
        product
    end

    def disable(id)
        update(id, { active: false })
    end

    def enable(id)
        update(id, { active: true })
    end

    def products_with_low_stock(threshold = 10)
        @model.where("stock <= ?", threshold)
    end

    def products_in_price_range(min_price, max_price)
        @model.where(price: min_price..max_price)
    end
end
