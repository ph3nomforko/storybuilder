class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :summary
      t.text :story_outline
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
