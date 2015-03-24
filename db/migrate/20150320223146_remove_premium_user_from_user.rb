class RemovePremiumUserFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_premium_user, :boolean, :default => false
  end
end
