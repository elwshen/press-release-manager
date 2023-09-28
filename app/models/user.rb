class User < ApplicationRecord
    belongs_to :entity, polymorphic: true
    enum role: {
        admin: 0,
        viewer: 1
    }
end
