class AddUrlAndButtonTextToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :url, :string
    add_column :posts, :button_text, :string
  end
end
