class CreateActivates < ActiveRecord::Migration[5.2]
  def change
    create_table :activates do |t|
      t.references :subject, polymorphic: true
      t.references :user, foreign_key: true, null: false
      t.integer :action_type, null: false
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
