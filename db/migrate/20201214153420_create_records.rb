class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.text :expect_picture, null: false
      t.text :treatment_picture, null: false
      t.text :storage_picture, null: false
      t.text :comment, null: false
      t.string :pain_a, null: false, default:""
      t.string :pain_b, null: false, default:""
      t.string :pain_c, null: false, default:""
      t.string :person_in_charge, null: false
      t.integer :pain_level, null: false, default:0
      t.timestamps
    end
  end
end
