class RequireBoilerplate::Railtie < Rails::Railtie
  rake_tasks do
    Dir['tasks/*.rake'].each { |f| load f }
  end
end if defined?(Rails::Railtie)