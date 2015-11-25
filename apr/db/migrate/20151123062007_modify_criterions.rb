class ModifyCriterions < ActiveRecord::Migration
  def change
    add_column("criterions", "field1", :string, :limit => 500)
    add_column("criterions", "field2", :string, :limit => 500)
  end
end
