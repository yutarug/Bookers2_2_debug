class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id#followしている人=>user
      t.integer :followee_id#followされている人=>follow

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followee_id
    add_index :relationships, [:follower_id, :followee_id], unique: true
  end
end
