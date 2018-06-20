class Article < ActiveRecord::Migration[5.2]
  def change
    create_table :article_soumis do |t|   
      t.string :titre
      t.timestamps
    end
  end
end
