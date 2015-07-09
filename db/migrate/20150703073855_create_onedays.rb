class CreateOnedays < ActiveRecord::Migration
  def change
    create_table :onedays do |t|
      t.integer :oneweek_id
      t.string  :thedate
      t.datetime :thedatetime
      t.timestamps null: false
    end
  end
end
