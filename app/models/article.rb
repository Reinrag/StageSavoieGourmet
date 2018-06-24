class Article < ActiveRecord::Base
    
    validates :titre, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}

end