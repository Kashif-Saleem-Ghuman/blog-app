class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :Bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end