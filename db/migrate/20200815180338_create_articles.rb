class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :author_id
      t.text :title
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
