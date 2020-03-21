class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :title
      t.text :description
      t.integer :kind

      t.string :street
      t.string :postcode
      t.string :city

      t.timestamps

      t.belongs_to :user
    end
  end
end
