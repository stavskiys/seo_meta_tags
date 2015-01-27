class CreateSeoMetaTagsSeoSets < ActiveRecord::Migration
  def change
    create_table :seo_meta_tags_seo_sets do |t|
      t.string :url
      t.string :title
      t.text :description
      t.text :keywords
      t.text :images_alt
      t.timestamps null: false
    end
  end
end
