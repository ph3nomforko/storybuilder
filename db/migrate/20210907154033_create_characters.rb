class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
