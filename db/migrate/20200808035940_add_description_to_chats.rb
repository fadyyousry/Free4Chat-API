class AddDescriptionToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :description, :text
  end
end
