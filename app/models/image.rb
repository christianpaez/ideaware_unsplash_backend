class Image < ApplicationRecord
    validates :unsplash_id, presence: true
    validates :description, presence: true
    validates :url, presence: true
    validates :html, presence: true
end
