class CreateSjBanners < ActiveRecord::Migration
  def change
    create_table :sj_banners do |t|
      t.string :title
      t.string :subtitle
      t.string :Image_Url
      t.string :transition_url

      t.timestamps null: false
    end
  end
end
