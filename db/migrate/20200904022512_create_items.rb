class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.string    :user     , null: false
      t.string    :name     , null: false
      t.text    :description     , null: false
      t.integer    :price     , null: false
      t.integer    :category_id     , null: false
      t.integer    :fee_burden_id     , null: false
      t.integer    :prefecture_id     , null: false
      t.integer    :status_id     , null: false
      t.integer    :delivery_day_id     , null: false
      t.timestamps
    end
  end
end
  