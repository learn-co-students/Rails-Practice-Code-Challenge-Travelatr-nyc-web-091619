class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts

   

    def five_most_recent 
        self.posts.max_by(5){|post| post.created_at}
    end 

    def bloggers_ages 
        self.bloggers.map do |blogger|
            blogger.age 
        end 

    end 


    def average_age_of_bloggers 
       sum =  bloggers_ages.reduce(0){|sum, x| sum+x }
       sum/ (bloggers_ages.count)
    end 




end
