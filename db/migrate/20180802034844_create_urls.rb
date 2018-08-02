class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :code, null: false
      t.string :url, null: false
      t.integer :visits, default: 0
      t.timestamps

      t.index :code
      t.index :url
    end
  end
end
