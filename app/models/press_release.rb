class PressRelease < ApplicationRecord
    belongs_to :organization

    validates :title, presence: true
    validates :content, presence: true
    validates :publish_date, presence: true
end
