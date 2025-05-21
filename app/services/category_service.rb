class CategoryService
    def initialize(repository = CategoryRepository.new)
        @repository = repository
    end

    def list_categories
        @repository.all
    end

    def get_category(id)
        @repository.find(id)
    end

    def create_category(params)
        @repository.create_with_slug(params)
    end

    def update_category(id, params)
        @repository.update(id, params)
    end

    def delete_category(id)
        @repository.destroy(id)
    end

    def disable_category(id)
        @repository.disable(id)
    end

    def enable_category(id)
        @repository.enable(id)
    end

    def active_categories
        @repository.active_categories
    end

    def inactive_categories
        @repository.inactive_categories
    end
end
