module HelloRails
  class AppData
    include StringUtils

    attr_reader :name, :repo, :directory, :formatted_name, :dash_name,
      :snake_name, :camel_name, :title_name

    def initialize(opts = {})
      @name           = opts[:app_name]
      @repo           = opts[:repo] || STARTER_REPO
      @directory      = File.expand_path(name.strip.to_s)
      @formatted_name = File.basename(directory).gsub(/\s+/, '-')
      @dash_name      = dashize(formatted_name)
      @snake_name     = snake_case(formatted_name)
      @camel_name     = camelize(snake_name)
      @title_name     = titleize(snake_name)
    end
  end
end
