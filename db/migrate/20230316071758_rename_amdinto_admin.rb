class RenameAmdintoAdmin < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :amdin, :admin
  end
end
