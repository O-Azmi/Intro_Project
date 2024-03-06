class Publisher < ApplicationRecord
    validates :publisher_name, presence: true, length: { minimum: 5 }
    has_many :publications, dependent: :destroy
    has_many :books, through: :publications
end
