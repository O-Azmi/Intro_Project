class Publisher < ApplicationRecord
    has_many :publications, dependent: :destroy
    has_many :books, through: :publications
end
