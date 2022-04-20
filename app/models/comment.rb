class Comment < ApplicationRecord
  include Visible

  belongs_to :post
  has_rich_text :body
end
