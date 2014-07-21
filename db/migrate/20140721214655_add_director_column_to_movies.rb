class AddDirectorColumnToMovies < ActiveRecord::Migration
  def up
    add_column :movies, :director, :string
  end
  
  def down
    removie_column :movies, :director
  end
end
