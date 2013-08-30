class RemoveUserFromLanguages < ActiveRecord::Migration
  def change
    remove_column :languages, :user_id
  end
end
