class Publisher < ApplicationRecord
    has_many :users, :as => :entity
end
