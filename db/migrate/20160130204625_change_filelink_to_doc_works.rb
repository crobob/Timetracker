class ChangeFilelinkToDocWorks < ActiveRecord::Migration
  def change
    remove_column :works, :linked_file
    add_column :works, :doc, :string
  end
end
