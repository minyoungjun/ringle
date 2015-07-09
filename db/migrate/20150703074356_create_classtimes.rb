class CreateClasstimes < ActiveRecord::Migration
  def change
    create_table :classtimes do |t|

      t.integer :onetime_id
      t.integer :user_id
      t.datetime :thedatetime
      t.integer :priority, default: 0 #0: 1순위 1: 2순위

      t.timestamps null: false
    end
  end
end
