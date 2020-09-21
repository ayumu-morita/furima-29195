class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.references    :purchase     , null: false, foreign_key: true
      t.string        :post_code    , null: false
      t.integer       :prefecture_id, null: false
      t.string        :city         , null: false
      t.string        :building     , null: false
      t.string        :phone_number , null: false
      t.string        :address      , null: false
    end
  end
end
