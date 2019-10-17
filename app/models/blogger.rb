class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length:{ minimum: 30 }

    def total_likes
        like_num = 0
        posts.each{|post| like_num += post.likes}
        return like_num
    end

    def featured_post
        post_id = posts.max_by(&:likes).id 
        Post.find(post_id)
    end

end
