class CreateSellerResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_responses do |t|
      t.text :response_text

      t.timestamps
    end
  end
end
