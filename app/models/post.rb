class Post < ApplicationRecord    
    include Visible

    validates_presence_of :title, on: :create, message: "Title can't be blank"
    validates_presence_of :body, on: :create, message: "Body can't be blank", length: {minimum:10}

    has_rich_text :body
    has_many :comments, dependent: :destroy
    belongs_to :user
end
