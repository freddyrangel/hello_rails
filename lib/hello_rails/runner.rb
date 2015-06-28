module HelloRails
  class Runner
    attr_accessor :cli_handler, :app

    def initialize(opts = {})
      @cli_handler = opts[:cli_handler] || CliHandler.new
      @app         = opts[:app] || App.new
    end

    def run
      app.create!(app_args) if app_args
    end

    private

    def app_args
      cli_handler.get_args
    end
  end
end
