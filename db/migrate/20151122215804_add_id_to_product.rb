class AddIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, 'integer USING CAST(supplier_id AS integer)'
  end
end
