# frozen_string_literal: true

class ChangeRelationshipNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :relationships, :follower_id, :integer, null: false
    change_column :relationships, :followed_id, :integer, null: false
  end
end
