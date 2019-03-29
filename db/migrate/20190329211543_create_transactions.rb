class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.text :review

      t.timestamps
    end
    
  add_reference :transactions, :user, index: true
  add_reference :transactions, :item, index: true
  end
end
