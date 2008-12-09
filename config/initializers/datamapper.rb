require "dm-core"
hash = YAML.load(File.new(Rails.root + "/config/database.yml"))
DataMapper.setup(:default, 'mysql://root:mysql@localhost/dm2_dev' )
