module HelloRails
  class TagManager
    include UnixUtils

    attr_accessor :app_data, :prototype, :latest_tag, :tarball_url,
      :cached_prototypes_dir

    def fetch_latest(app_data)
      @app_data = app_data
      check_latest_version_on_github
      cache_latest_version
    end

    private

    def repo
      app_data.repo
    end

    def app_directory
      app_data.directory
    end

    def check_latest_version_on_github
      print "Checking for the latest version of the app...".colorize(:yellow)
      $stdout.flush
      set_tag_variables
      print " #{latest_tag}.".colorize(:white)
      $stdout.flush
    end

    def set_tag_variables
      latest_tag_obj = fetch_latest_tag_obj
      @latest_tag     = latest_tag_obj['name']
      @tarball_url    = latest_tag_obj['tarball_url']
    end

    def fetch_latest_tag_obj
      url          = "https://api.github.com/repos/#{repo}/tags"
      uri          = URI.parse(url)
      http         = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request      = Net::HTTP::Get.new(URI.encode(url))
      response     = http.request(request)
      parse_response(response)
    end

    def parse_response(response)
      if response.code == '200'
        result = JSON.parse(response.body).first
        unless result
          messenger.repo_has_no_tags
          exit 1
        end
        result
      else
        messenger.failed_github_request(status_code: response.code)
        exit 1
      end
    end

    def cache_latest_version
      @cached_prototypes_dir = File.join(Dir.home, ".hello_rails")
      @prototype = "#{cached_prototypes_dir}/#{repo.sub('/', '--')}-#{latest_tag}.tar.gz"
      if File.exists?(prototype)
        puts " Using cached version.".colorize(:yellow)
      else
        download_latest_version
      end
    end

    def download_latest_version
      print " Downloading...".colorize(:yellow)
      $stdout.flush
      Dir.mkdir(cached_prototypes_dir, 0755) unless Dir.exists?(cached_prototypes_dir)
      shell "curl -s -L #{tarball_url} -o #{prototype}"
      puts " done!".colorize(:yellow)
    end
  end
end
