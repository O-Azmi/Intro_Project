class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :author_name
      t.date :author_birthdate

      t.timestamps
    end
  end
end
