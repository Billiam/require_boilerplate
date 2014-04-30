module RequireBoilerplate
  module Asset
    extend self

    def fetch(url, local_path)
      #TODO: error on 404
      #TODO: error on unwritable destination
      File.write(local_path, Net::HTTP.get(URI.parse(url)))
    end
  end
end