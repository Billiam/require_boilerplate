require 'digest/md5'

module RequireBoilerplate
  class Build
    def self.build_all
      #TODO: create and run build instances from configuration
      new.run
    end

    def initialize(config={})

    end

    def run
      #TODO: Generic configuration
      options = APP_CONFIG['rjs'] || {}
      #TODO: Safer cli creation
      flags = options.map { |key, val| %Q(#{key}="#{val}") }.join ' '

      #TODO: softcode input paths, allow multiple configurations
      input_path = Rails.root.join('app/assets/javascripts/kiosk')
      output_path = Rails.root.join('public/assets/kiosk')

      #TODO: Use default download location or override
      build_script = Rails.root.join('script/asset_build/r.js')

      #TODO: Output filename from input manifest
      output_file = 'application.js'
      output = output_path.join(output_file)
      output_gz = output_path.join("#{output_file}.gz")

      #TODO: allow configurable path to node
      # Build application.js file in assets
      cmd = "cd #{input_path} && node #{build_script} -o build.js out=#{output} #{flags}"

      `#{cmd}`

      self.class.digest(output)
    end

    def self.path_info(file)
      ext = File.extname(file)
      base_name = File.basename(file, ext)
      directory = File.dirname(file)
      #TODO relative path
      [directory, base_name, ext]
    end

    def self.digest(file)
      #TODO: get directory relative to asset path?
      directory, filename, ext = path_info(file)

      # Read content for digest and gzip
      output_content = IO.read(file)

      #TODO: Gzip conditionally
      #Create new gzip files
      IO.binwrite output_gz, ActiveSupport::Gzip.compress(output_content)

      #TODO: Conditional, if using digests? Match sprockets-rails behavior
      # Create md5 digest of new file
      hash = Digest::MD5.hexdigest output_content

      digested_filename = "#{filename}-#{hash}#{ext}"
      digested_gz = "#{digested}.gz"

      #TODO: Conditional, if gzipping? Match sprockets-rails behavior
      #Rails 4 will not use non-digest assets
      FileUtils.cp output, output_path.join(digested_filename)
      FileUtils.cp output_gz, output_path.join(digested_gz)

      update_manifest(file, "#{directory}/#{digested_filename}")
    end

    def self.update_manifest(file, digest_path)
      #TODO: error on invalid arguments, missing/unwritable manifest
      manifest_file = Rails.root.join('public/assets/manifest.yml')

      manifest = YAML.load_file manifest_file
      manifest[file] = digest_path

      File.open(manifest_file, 'w') { |f| YAML.dump(manifest, f)}
    end
  end
end