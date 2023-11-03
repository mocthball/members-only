class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.text :title
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
