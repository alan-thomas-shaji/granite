class MakeTitleNotNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :body, false
  end
end
