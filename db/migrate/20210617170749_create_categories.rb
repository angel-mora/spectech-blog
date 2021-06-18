class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :priority
      t.belongs_to :article

      t.timestamps
    end
  end
end
