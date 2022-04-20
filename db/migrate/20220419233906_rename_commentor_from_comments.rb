class RenameCommentorFromComments < ActiveRecord::Migration[7.0]
  def change
    change_table :comments do |t|
      t.rename :commentor, :commenter
      #Ex:- rename("pasword","hashed_pasword")
    end
  end
end
