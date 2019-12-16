class ChangeColumnNullProfile < ActiveRecord::Migration[5.2]
  def change
	change_column_null :profiles, :user_id, false
  end
end
