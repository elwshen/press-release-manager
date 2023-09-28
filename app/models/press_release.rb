class PressRelease < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :publish_date, presence: true
end
