migration 1, :create_<%= table_name %>_table do

  up do
    create_table :<%= table_name %> do
      column :id, Integer, :serial => true
      <% for attribute in attributes -%>  
        column :<%= attribute.name %>,  :<%= attribute.type %>    
      <% end -%>
    end
  end
  
  down do
    drop_table :<%= table_name %>
  end
end

