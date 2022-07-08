class CreateTagDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_documents do |t|
      
      t.integer :document_id, null: false
      t.integer :tag_id,      null: false
      t.timestamps
    end
  end
end
