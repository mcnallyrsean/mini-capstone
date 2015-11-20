class AddStockedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stocked, :boolean
  end
end
