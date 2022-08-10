class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_code, :string
    add_column :users, :address, :string
    add_column :users, :biography, :text
  end
end
