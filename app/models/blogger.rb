class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :bio, length: { minimum: 30 }
    validates :name, uniqueness: true, presence: true
    validates :age, numericality: { greater_than: 0 }

    def count_likes
        self.posts.inject(0) {|sum, post| sum + post.likes}
    end

    def top_post
        self.posts.max_by {|post| post.likes}
    end

    def top_destinations
        dest_count = {}
        self.posts.each do |post|
           if dest_count[post.destination.id]
                dest_count[post.destination.id] += 1
           else
                dest_count[post.destination.id] = 1
           end
        end
       
        dest_count.max(5).map {|array| Destination.find(array[0])}
    end
end
