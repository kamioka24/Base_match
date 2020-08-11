class AddUnreadToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :unread, :boolean
  end
end
