class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nick_name
      t.string :provider
      t.string :uid
      t.string :role

      t.timestamps
    end
    add_index :users, :name, unique: true
    # add_index :users, [:uid, :provider], unique: true
  end
end
