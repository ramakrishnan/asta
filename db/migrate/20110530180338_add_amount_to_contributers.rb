class AddAmountToContributers < ActiveRecord::Migration
  def self.up
    add_column :contributers, :amount, :integer
  end

  def self.down
    remove_column :contributers, :amount
  end
end
