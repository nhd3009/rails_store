class BaseRepository
    def initialize(model)
        @model = model
    end

    def all
        @model.all
    end

    def find(id)
        @model.find(id)
    end

    def find_by(conditions)
        @model.find_by(conditions)
    end

    def create(attributes)
        @model.create(attributes)
    end

    def update(id, attributes)
        record = find(id)
        record.update(attributes)
        record
    end

    def destroy(id)
        record = find(id)
        record.destroy
    end
end
