class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.integer :link_id

      t.timestamps
    end
  end
end
