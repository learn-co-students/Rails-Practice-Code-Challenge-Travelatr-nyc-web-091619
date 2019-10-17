class Post < ApplicationRecord
belongs_to :destination
belongs_to :blogger

validates :content, length: {minimum: 100}


end
