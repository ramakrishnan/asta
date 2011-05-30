class CreateKshetrams < ActiveRecord::Migration
  def self.up
    create_table :kshetrams do |t|
      t.string :name
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :kshetrams
  end
end
