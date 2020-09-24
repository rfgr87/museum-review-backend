class CreateReviewsMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews_migrations do |t|
      t.text :review
      t.belongs_to :museum, null: false, foreign_key: true
    end
  end
end
