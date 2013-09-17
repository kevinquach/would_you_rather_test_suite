class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
