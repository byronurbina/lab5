class Product < ActiveRecord::Base
belongs_to: inventories

validates_presence_of :title, :description, :price, :image_url 
validates_numericality_of :price, :greater_than => 0.01 
validates_numericality_of :proyection, :greater_than => 0 
validates_uniqueness_of :title
validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,:message => "check URL"

before_create : metodo1
after_update : metodo2
after_destroy : metodo3


	def metodo1
		invent = Inventory.new
		invent.previous_balance = 0
		invent.new_balance = ammount
		invent.future_balance = ammount + projection
		invent.save
	end
	
	def metodo2
		anterior = regAnt =Inventory.where("product_id = :id").last
		nuevo = Inventory.new
		nuevo.previous_balance = anterior.new_balance
		nuevo.new_balance = ammount
		nuevo.future_balance = ammount + projection
		nuevo.save
	end
	
	def metodo3
		consulta = Inventory.find_by_product_id(id)
		consulta.each do |tupla|
		tupla.delete()
		end
	end
		

end
