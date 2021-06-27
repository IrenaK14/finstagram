configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }

  # Load all models from app/models, using autoload instead of require
  postgres://epajxkchcigwga:f65ac9e4c2b7e006444cf6de195670c54d30042cb459bb0089c779beaa153a65@ec2-3-214-136-47.compute-1.amazonaws.com:5432/dea33ac6a87pvo
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
