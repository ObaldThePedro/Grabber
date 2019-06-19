class RemoveDefault < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :available, :boolean, :null => false, :default => true
  end
end
