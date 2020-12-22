class RemoveCommentFromRecords < ActiveRecord::Migration[5.2]
  def up
    remove_column :records, :comment, :text
  end

  def down
    add_column :records, :comment, :text
  end
end
