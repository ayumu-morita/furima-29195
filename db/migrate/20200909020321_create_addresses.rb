class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.references    :purchase     , null: false, foreign_key: true
    end
  end
end
