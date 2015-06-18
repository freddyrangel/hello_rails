module HelloRails
  class App
    extend Forwardable
    include UnixUtils

    attr_reader :current_ruby_version, :messenger, :app_data, :app_installer

    def_delegators :app_data, :name, :repo, :directory, :formatted_name,
      :dash_name, :snake_name, :camel_name, :title_name

    def initialize
      @current_ruby_version = RUBY_VERSION
      @app_installer        = AppInstaller.new
    end

    def create!(opts = {})
      @app_data  = AppData.new(opts)
      @messenger = Messenger.new(app_data: app_data, ruby_version: current_ruby_version)
      welcome_message if app_directory_empty?
      app_installer.run(app_data)
      configure_app
    end

    private

    def app_directory_empty?
      if Dir["#{directory}/*"].empty?
        true
      else
        messenger.directory_not_empty
        exit 1
      end
    end

    def welcome_message
      messenger.welcome
    end

    def rename_app
      Dir.chdir(directory) do
        {
          'HellosignRailsStarterApp'  => camel_name,
          'hellosign-rails-starter-app' => dash_name,
          'hellosign_rails_starter_app' => snake_name,
          'Hellosign Rails Starter App' => title_name
        }.each do |proto_name, new_name|
          shell "find . -type f -print | xargs #{sed_i} 's/#{proto_name}/#{new_name}/g'"
        end
      end
    end

    def configure_app
      rename_app
      initialize_git
      print_success_message
    end

    def initialize_git
      Dir.chdir(directory) do
        shell "git init"
        shell "git add -A ."
        shell "git commit -m 'Initial commit.'"
      end
    end

    def print_success_message
      messenger.success_message
    end
  end
end
