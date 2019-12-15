class AddColumnFirstNameToMessage < ActiveRecord::Migration[5.2]
  def change
	change_table :messages do |t|
		t.belongs_to :to, class_name: "User", foreign_key: true
	end
  end
end
