Rails.application.routes.draw do
    patch "posts/:id/increase_like", to: "posts#increase_like", as: "increase_like"

    resources :bloggers 
    resources :destinations
    resources :posts 
end

# create button to like 
# when clicked, needs to call a funciton increment like count 
#update @post.like by 1 
# direct back to show page 



