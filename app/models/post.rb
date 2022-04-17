class Post < ApplicationRecord    
    validates_presence_of :title, on: :create, message: "can't be blank"

    has_rich_text :body
end
