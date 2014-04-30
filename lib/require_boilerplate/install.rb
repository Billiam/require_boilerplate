module RequireBoilerplate
  module Install
    extend self

    def run
      unless File.directory? config_dir
        raise 'Config directory could not be found'
      end

      if File.exist?(target)
        raise 'config/requirejs.yml already exists'
      end

      FileUtils.cp source, destination
    end

    def source
      File.expand_path '../../requirejs.yml', __FILE__
    end

    def target
      config_dir.join 'requirejs.yml'
    end

    def config_dir
      Rails.root.join 'config'
    end
  end
end