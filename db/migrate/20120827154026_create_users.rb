class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :designation
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
