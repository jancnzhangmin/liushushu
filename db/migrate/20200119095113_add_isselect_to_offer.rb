class AddIsselectToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :isselect, :integer
  end
end
