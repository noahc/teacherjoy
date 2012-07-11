class AddCountToHolders < ActiveRecord::Migration
  def change
  	 add_column :holders, :prints, :integer
  end
end
