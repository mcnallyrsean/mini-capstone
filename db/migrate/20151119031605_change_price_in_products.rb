class ChangePriceInProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, 'integer USING CAST(column_name AS integer'
  end
end
