class AddSubtitleToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :subtitle, :string
  end
end
