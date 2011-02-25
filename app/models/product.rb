class Product < ActiveRecord::Base
validates_presence_of :name, :title, :description, :price, :image_url 
validates_numericality_of :price, :greater_than => 0.01 
validates_numericality_of :proyection, :greater_than => 0 
validates_uniqueness_of :title
validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,:message => "check URL"


end
