class AddSearchToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :search, :string
  end
end
