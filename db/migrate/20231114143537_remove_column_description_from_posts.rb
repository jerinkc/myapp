class RemoveColumnDescriptionFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :description, :text
  end
end
