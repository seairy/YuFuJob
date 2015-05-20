# -*- encoding : utf-8 -*-
class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :city, null: false
      t.string :title, limit: 150, null: false
      t.text :content, limit: 30000, null: false
      t.boolean :visible, null: false
      t.date :started_at, null: false
      t.timestamps null: false
    end
  end
end
