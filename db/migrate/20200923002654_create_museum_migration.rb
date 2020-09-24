class CreateMuseumMigration < ActiveRecord::Migration[6.0]
  def change
    create_table :museum_migrations do |t|
      t.string :name
      t.text :description
    end
  end
end
