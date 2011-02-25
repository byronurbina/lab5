class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
	t.integer :id
	t.string :title
	t.string :description
	t.string :image_url
	t.decimal :price ,:precision =>8, :scale =>2
	t.integer :proyection
	t.integer :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
