class CreatePostsAgain < ActiveRecord::Migration[5.0]
  def change
    drop_table :posts

    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.integer :type

      t.timestamps
    end
  end
end
