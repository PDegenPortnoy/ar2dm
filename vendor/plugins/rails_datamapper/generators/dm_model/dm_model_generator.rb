require 'rails_generator/generators/components/model/model_generator'

class DmModelGenerator <ModelGenerator

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name, "#{class_name}Test"

      # Model, test, and fixture directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('test/unit', class_path)

      # Model class, unit test, and fixtures.
      m.template 'model.rb',      File.join('app/models', class_path, "#{file_name}.rb")
      puts "PETER: generated model.rb template!"
      m.template 'unit_test.rb',  File.join('test/unit', class_path, "#{file_name}_test.rb")
      puts "PETER: generated unit_test.rb template!"

      unless options[:skip_migration]
        puts "PETER: Not skipping migration!"
        m.migration_template 'migration.rb', 'db/migrate', :assigns => {
          :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
        }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
        puts "PETER: generated migration.rb template!"
      end
      puts "PETER: finished processing record!"
    end
  end

end
