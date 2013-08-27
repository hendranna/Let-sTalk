class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :skype_accout, :string
    add_column :users, :language, :string
    add_column :users, :biography, :text
    add_column :users, :avatar, :string
    add_column :users, :available_to_meet, :boolean
  end
end
