class AddCategoryToCharacters < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE character_category AS ENUM ('celebrity', 
                                    'superhero', 
                                    'anime', 
                                    'fake friend', 
                                    'other');
    SQL

    add_column :characters, :category, :character_category
  end

  def down
    remove_column :characters, :category
    execute <<-SQL
      DROP TYPE character_category;
    SQL
  end
end
