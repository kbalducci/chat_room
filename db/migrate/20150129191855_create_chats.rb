class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :name
      t.string :message
      t.string :like
      t.string :photo

      t.timestamps null: false
    end
  end
end
