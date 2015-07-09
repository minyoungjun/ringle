class CreateOnetimes < ActiveRecord::Migration
  def change
    create_table :onetimes do |t|

      t.integer :oneday_id
      t.integer :clock
      t.integer :minute, default: 0

      t.timestamps null: false
    end
  end
end
