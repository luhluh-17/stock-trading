class RemoveIsVerifiedFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_verified, :boolean
  end
end
