require 'lorem'

class Book
  include DataMapper::Resource
  property :id, Integer, :serial => true
  property :amount, Float
  property :date, Date
  property :name, String
  property :description, Text, :lazy => true
  
  def self.create_dummy_data(num)
    RAILS_DEFAULT_LOGGER.debug("Book.create_dummy_data(#{num})")
    num.times do |number| 
      t = Book.new
      t.attributes = {:amount => number, :date => Time.now(), :name => Lorem.lorem(4, false), :description => Lorem.lorem(60, false)}
      t.save
    end
  end
  
end
