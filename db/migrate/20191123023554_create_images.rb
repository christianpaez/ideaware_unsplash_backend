class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :unsplash_id
      t.text :description
      t.text :url
      t.text :html

      t.timestamps
    end
  end
end
