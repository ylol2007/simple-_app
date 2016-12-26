class CreateSjModels < ActiveRecord::Migration
  def change
    create_table :sj_models do |t|
      t.string :itle
      t.string :string

      t.timestamps null: false
    end
  end
end
