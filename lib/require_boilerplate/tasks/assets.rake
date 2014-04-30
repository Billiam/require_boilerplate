if Rake::Task.task_defined? 'assets:precompile:nondigest'
  #rails 3
  asset_task = Rake::Task['assets:precompile:nondigest']
elsif Rake::Task.task_defined? 'assets:precompile'
  #rails 4+
  asset_task = Rake::Task['assets:precompile']
end

if defined? asset_task
  asset_task.enhance do
    Rake::Task['assets:precompile:rjs'].invoke
  end
end

namespace :assets do
  namespace :precompile do
    desc 'Precompile requirejs modules'
    task :rjs do
      RequireBoilerplate::Build.build_all
    end
  end
end
