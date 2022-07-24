class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, type: :bigint, foreign_key: true
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
