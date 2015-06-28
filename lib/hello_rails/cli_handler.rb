module HelloRails
  class CliHandler
    attr_accessor :app_args, :option_parser

    def initialize
      @app_args = OpenStruct.new
    end

    def get_args
      begin
        set_and_return_app_args
      rescue OptionParser::InvalidOption
        usage_and_exit(option_parser)
      end
    end

    private

    def option_parser
      @option_parser ||= OptionParser.new do |opts|
        opts.banner = "Usage: hello_rails [options] NEW_APP_NAME"
        opts.on('-h', '--help', "Show hello_rails usage") do
          usage_and_exit(opts)
        end
        opts.on('-r', '--repository [github_repo]', "Github repo (e.g. hello_sign/hello_sign).") do |repo_name_from_cli|
          app_args.repo = repo_name_from_cli
        end
      end
    end

    def set_and_return_app_args
      option_parser.parse!
      app_args.app_name = ARGV.first
      raise OptionParser::InvalidOption if app_args.app_name.nil?
      app_args
    end

    def usage_and_exit(parser)
      puts parser
      exit 1
    end
  end
end
