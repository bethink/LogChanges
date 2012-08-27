class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.string :date
      t.references :user
      t.string :json_attrs

      t.timestamps
    end
    add_index :user_logs, :user_id
  end
end