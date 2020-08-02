class AddOwnerToChats < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :owner, null: false, foreign_key: { to_table: :users }
  end
end
