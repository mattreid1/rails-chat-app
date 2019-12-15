class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name, :default => "[ERROR: DEFAULT NAME]", null: false
      t.boolean :admin, :default => false, null: false
      t.date :birthday
      t.boolean :student, :default => true, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
