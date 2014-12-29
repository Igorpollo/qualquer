class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :texto
      t.references :user
      t.references :place

      t.timestamps
    end
  end
end
