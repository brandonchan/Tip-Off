class CreateStubhubs < ActiveRecord::Migration
  def change
    create_table :stubhubs do |t|
      t.string :primary
      t.string :secondary
      t.string :title
      t.integer :price
      t.string :url
      t.string :date
      t.timestamps null: false
    end
  end
end
