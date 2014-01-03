class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user
      t.references :commentable, polymorphic: true

      t.timestamps
    end

    add_index :comments, [:commentable_type, :commentable_id]
  end
end
