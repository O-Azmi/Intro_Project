class Author < ApplicationRecord
    validates :author_name, presence: true, length: { minimum: 5 }
    has_many :books
end
