class Comment < ApplicationRecord
  include Visible

  belongs_to :post
  belongs_to :user
  has_rich_text :body
end
