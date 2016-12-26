class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :right
      t.string :string

      t.timestamps null: false
    end
  end
end
