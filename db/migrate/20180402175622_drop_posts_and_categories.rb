class DropPostsAndCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :posts
    drop_table :categories

    create_table :news do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :type
      t.string :image
      t.string :url
      t.string :button_text

      t.timestamps
    end

    create_table :actions do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :type
      t.string :image
      t.string :url
      t.string :button_text

      t.timestamps
    end

    create_table :houses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :type
      t.string :image
      t.string :url
      t.string :button_text

      t.timestamps
    end

  end
end
