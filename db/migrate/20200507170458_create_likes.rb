class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :comment, index: true
      t.belongs_to :gossip, index: true
      t.timestamps
    end
  end
end
