class Category < ApplicationRecord
    has_many :events

    validates :identifier, presence: true
    validates :name, presence: true

end
