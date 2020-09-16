class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content

      t.references :parent, index: true, foreign_key: { to_table: :comments }
      t.references :post, index: true, foreign_key: true

      t.timestamps
    end
  end
end
