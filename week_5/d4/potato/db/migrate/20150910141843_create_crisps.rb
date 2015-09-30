class CreateCrisps < ActiveRecord::Migration
  def change
    create_table :crisps do |t|

      t.timestamps null: false
    end
  end
end
