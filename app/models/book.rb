class Book < ApplicationRecord
    validates :title, :author, :read_date, :rating, presence: true
    
    validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }


end
