class MoveLevelToUserLanguages < ActiveRecord::Migration
  def change
    remove_column :languages, :level
    add_column :user_languages, :level, :string
  end
end
