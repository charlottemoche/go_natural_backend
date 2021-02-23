class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :image_url
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
