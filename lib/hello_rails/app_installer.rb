module HelloRails
  class AppInstaller
    include UnixUtils

    attr_accessor :tag_manager, :app_data, :prototype, :latest_tag, :tarball_url

    def initialize
      @tag_manager = TagManager.new
    end

    def run(app_data)
      @app_data = app_data
      tag_manager.fetch_latest(app_data)
      @prototype = tag_manager.prototype
      unwrap_tarball
    end

    private

    def repo
      app_data.repo
    end

    def app_directory
      app_data.directory
    end

    def unwrap_tarball
      FileUtils.mkdir_p(app_directory)
      shell "tar xfz #{prototype} -C #{app_directory}"
      remove_github_added_extra_directory
    end

    def remove_github_added_extra_directory
      extraneous_dir = Dir.glob("#{app_directory}/*").first
      dirs_to_move   = Dir.glob("#{extraneous_dir}/*", File::FNM_DOTMATCH)
                          .reject { |d| %w{. ..}.include?(File.basename(d)) }
      FileUtils.mv         dirs_to_move, app_directory
      FileUtils.remove_dir extraneous_dir
    end
  end
end
