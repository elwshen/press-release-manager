class CreatePressReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :press_releases do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
