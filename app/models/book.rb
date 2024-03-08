class Book < ApplicationRecord
    belongs_to :author
    belongs_to :genre
    has_many :publications, dependent: :destroy
    has_many :publishers, through: :publications
    validates :book_name, presence: true, length: { minimum: 5 }
  
    def self.search(query, author_id)
      if author_id.present?
        where('book_name LIKE ? AND author_id = ?', "%#{query}%", author_id)
      else
        where('book_name LIKE ?', "%#{query}%")
      end
    end
  end
  