class CreateContributers < ActiveRecord::Migration
  def self.up
    create_table :contributers do |t|
      t.string :name
      t.string :surname
      t.integer :kshetram
      t.integer :adhimana_kshetram
      t.string :acharyan
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contributers
  end
end
