class AddQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
