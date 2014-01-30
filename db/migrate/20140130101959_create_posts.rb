class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end

    create_table :tags do |t|
      t.string :tag, null: false

      t.timestamps
    end

    create_table :post_tags, id: false do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
