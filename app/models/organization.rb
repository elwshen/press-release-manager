class Organization < ApplicationRecord
    has_many :users, :as => :entity
end
