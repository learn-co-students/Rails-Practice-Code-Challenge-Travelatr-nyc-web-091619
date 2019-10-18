class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def full_location
        "#{self.name}, #{self.country}"
    end

    def top_post
        self.posts.max_by {|post| post.likes}
    end

    def avg_age
        self.bloggers.inject(0) {|sum, blogger| sum + blogger.age} / self.bloggers.count
    end

    def recent_posts
        self.posts.max_by(5) {|post| post.created_at}
    end
    
end
