class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :from_id
      t.references :to_id
      t.text :message

      t.timestamps
    end
    add_index :chats, :from_id_id
    add_index :chats, :to_id_id
  end
end
