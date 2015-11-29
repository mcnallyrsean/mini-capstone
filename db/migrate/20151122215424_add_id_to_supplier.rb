class AddIdToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :supplier_id 'integer USING CAST(supplier_id AS integer)'
  end
end
