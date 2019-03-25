class AddEmailToLegacyapis < ActiveRecord::Migration[5.2]
  def change
    add_column :legacyapis, :email, :string
  end
end
