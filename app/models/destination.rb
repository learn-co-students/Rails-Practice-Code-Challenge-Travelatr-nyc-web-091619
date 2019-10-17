class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        post_id = posts.max_by(&:likes).id
        Post.find(post_id)
    end

    def latest_5_posts
        sorted_posts = posts.sort_by { |post| post.created_at }.reverse
        return sorted_posts
    end

    def avg_age
        total_age = 0
        uniq_bloggers = bloggers.each.uniq
        uniq_bloggers.each{|blogger| total_age += blogger.age}
        return total_age/bloggers.each.uniq.count
    end
end
