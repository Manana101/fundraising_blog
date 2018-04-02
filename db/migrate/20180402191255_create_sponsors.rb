class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
