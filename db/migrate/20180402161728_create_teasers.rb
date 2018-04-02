class CreateTeasers < ActiveRecord::Migration[5.0]
  def change
    create_table :teasers do |t|
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
