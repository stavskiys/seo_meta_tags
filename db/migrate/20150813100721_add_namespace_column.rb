class AddNamespaceColumn < ActiveRecord::Migration
  def change
    add_column :seo_meta_tags_seo_sets, :namespace, :string, null: false, default: ''
  end
end
