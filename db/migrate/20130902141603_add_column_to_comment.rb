class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :writer_id, :integer
  end
end
