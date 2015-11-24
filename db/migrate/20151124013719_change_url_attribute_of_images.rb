class ChangeUrlAttributeOfImages < ActiveRecord::Migration
  def change
    change_column :images, :product_id, :integer
  end
end
