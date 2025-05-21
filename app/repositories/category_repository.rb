class CategoryRepository < BaseRepository
    def initialize
        super(Category)
    end

    def disable(id)
        update(id, { active: false })
    end

    def enable(id)
        update(id, { active: true })
    end

    def find_by_name(name)
        find_by(name: name)
    end

    def active_categories
        @model.where(active: true)
    end

    def inactive_categories
        @model.where(active: false)
    end

    def active_categories
        @model.where(active: true)
    end

    def search_by_name(query)
        @model.where("name ILIKE ?", "%#{query}%")
    end

    def create_with_slug(attributes)
        attributes[:slug] = generate_slug(attributes[:name])
        create(attributes)
    end

    private

    def generate_slug(name)
        name.parameterize
    end
end
