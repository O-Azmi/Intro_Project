class Book < ApplicationRecord
    belongs_to :author
    belongs_to :genre
    has_many :publications, dependent: :destroy
    has_many :publishers, through: :publications
end
