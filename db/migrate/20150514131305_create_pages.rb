class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer :parent_id, null: true
      t.integer :view_id, null: true
      t.integer :view_id_for_child, null: true
      t.integer :position, default: 0
      t.integer :view_count, default: 0
      t.boolean :status, default: true
      t.timestamps null: false
    end
    add_foreign_key :pages, :views, column: :view_id, primary_key: :id
    add_foreign_key :pages, :views, column: :view_id_for_child, primary_key: :id

    Page.create_translation_table! name: :string, translit: :string, short_content: :text, content: :text, meta_title: :string, meta_keywords: :string, meta_description: :string
  end
  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
