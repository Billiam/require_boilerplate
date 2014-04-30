namespace :requirejs do
  desc 'Install base requirejs yaml config'
  task :install do
    require 'require_boilerplate/install'

    RequireBoilerplate::Install.run
  end

  namespace :install do
    desc 'download requirejs and r.js optimizer'
    task :assets do
      RequireBoilerplate::Asset.fetch(
        'https://raw.githubusercontent.com/jrburke/requirejs/master/require.js',
        Rails.root.join('app/assets/require.js')
      )
      RequireBoilerplate::Asset.fetch(
        'https://raw.githubusercontent.com/jrburke/r.js/master/dist/r.js',
        Rails.root.join('app/assets/r.js')
      )
    end
  end
end