class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :kind
      t.integer :status
      t.string :name
      t.integer :amount
      t.string :identifier

      t.references :institution

      t.timestamps
    end
  end
end
