class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :sex, limit: 1
      t.integer :lock_version
      t.timestamps
    end
  end
end
