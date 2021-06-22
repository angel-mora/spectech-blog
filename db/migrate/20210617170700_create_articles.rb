class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
