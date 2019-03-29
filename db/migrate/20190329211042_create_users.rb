class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :department
      t.string :major
      t.boolean :validated, default: false
      t.string :validation_code

      t.timestamps
    end
  end
end
