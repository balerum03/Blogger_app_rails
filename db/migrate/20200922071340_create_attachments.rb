class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :title
      t.text :body
      t.integer :article_id
      t.timestamps
    end
  end
end
