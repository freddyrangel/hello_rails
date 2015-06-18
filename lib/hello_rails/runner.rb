module HelloRails
  class Runner
    attr_accessor :cli_handler, :app

    def initialize
      @cli_handler = CliHandler.new
      @app         = App.new
    end

    def run
      app.create!(app_args) if cli_handler.parse!
    end

    private

    def app_args
      cli_handler.app_args
    end
  end
end
