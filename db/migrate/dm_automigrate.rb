migration 1, :create_books do
   up do
     create_table :books do
       column :id, Integer, :serial => true, :nullable? => false, :key => true
       column :amount, Float
       column :date, Date
       column :name, String
       column :description, DataMapper::Types::Text
     end
   end
  
  down do
    drop_table :books
  end
end

