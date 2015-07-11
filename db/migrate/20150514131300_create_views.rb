class CreateViews < ActiveRecord::Migration
  def up
    create_table :views do |t|
        t.string :path
        t.integer :view_type
    end
    View.create_translation_table! name: :string
  end
  def down
    drop_table :views
    View.drop_translation_table!
  end
end
