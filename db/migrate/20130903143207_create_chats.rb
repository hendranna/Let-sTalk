class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :from
      t.references :to
      t.text :message

      t.timestamps
    end
    add_index :chats, :from_id
    add_index :chats, :to_id
  end
end
