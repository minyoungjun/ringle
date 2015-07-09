class CreateOneweeks < ActiveRecord::Migration
  def change
    create_table :oneweeks do |t|
      
      t.string  :monday

      t.timestamps null: false
    end
  end
end
