class CreatePrototypes < ActiveRecord::Migration[6.0]
  belongs_to :user
  has_one_attached :image
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy
      t.text :concept
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
