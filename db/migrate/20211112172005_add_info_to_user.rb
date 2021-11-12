class AddInfoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :info, :string
  end
end
