class CreateTasksAgain < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks_agains do |t|
      t.text :title
      t.text :body
      t.timestamps
    end
  end
end
