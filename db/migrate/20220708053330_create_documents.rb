class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      
      t.integer :end_user_id, null: false
      t.text    :content,     null: false
      t.integer :feeling,     null: false, default: 0
      t.timestamps
    end
  end
end
