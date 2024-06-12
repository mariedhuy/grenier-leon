class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
