class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :article
      t.belongs_to :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
