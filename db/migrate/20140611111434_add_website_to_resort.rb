class AddWebsiteToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :website, :string
  end
end
