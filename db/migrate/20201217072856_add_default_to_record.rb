class AddDefaultToRecord < ActiveRecord::Migration[5.2]
  def up
    change_column :records, :expect_picture, :text, default: "a"
    change_column :records, :treatment_picture, :text, default: "a"
    change_column :records, :storage_picture, :text, default: "a"
  end

  def down
    change_column :records, :expect_picture, :text
    change_column :records, :treatment_picture, :text
    change_column :records, :storage_picture, :text
  end
end
