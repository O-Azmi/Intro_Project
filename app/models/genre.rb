class Genre < ApplicationRecord
    validates :genre_name, presence: true, length: { minimum: 5 }
    has_many :books
end
