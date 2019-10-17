class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30 }
    validates :age, numericality: {greater_than: 0} 


    def my_likes 
        self.posts.map do |post|
            post.likes 
        end 
    end 

    def sum_of_likes 
        my_likes.reduce(0){|sum, x| sum+x }
    end 


    def featured_post 
        self.posts.max_by{|post| post.likes}
    end 


    


end
