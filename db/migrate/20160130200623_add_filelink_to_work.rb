class AddFilelinkToWork < ActiveRecord::Migration
  def change
    add_column :works, :linked_file, :string
  end
end
