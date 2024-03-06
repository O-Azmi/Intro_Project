class Genre < ApplicationRecord
    validates :genre_name, presence: true, uniqueness: true
    has_many :books
end
