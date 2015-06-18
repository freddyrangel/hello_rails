module HelloRails
  class Messenger
    attr_reader :app_data, :ruby_version

    def initialize(opts = {})
      @app_data     = opts[:app_data]
      @ruby_version = opts[:ruby_version]
    end

    def welcome
      puts '    __  __     ____      ____        _ __'.colorize(:red)
      puts '   / / / /__  / / /___  / __ \____ _(_) /____'.colorize(:red)
      puts '  / /_/ / _ \/ / / __ \/ /_/ / __ `/ / / ___/'.colorize(:red)
      puts ' / __  /  __/ / / /_/ / _, _/ /_/ / / (__  ) '.colorize(:red)
      puts '/_/ /_/\___/_/_/\____/_/ |_|\__,_/_/_/____/ '.colorize(:red)
      puts
      puts "HelloRails will create new app in directory:".colorize(:yellow) + " #{app_data.name}".colorize(:yellow) + "...".colorize(:yellow)
      puts
      puts "-".colorize(:blue) + " Application Name:".colorize(:light_blue) + " #{app_data.title_name}".colorize(:light_reen)
      puts "-".colorize(:blue) + " Project Template:".colorize(:light_blue) + " #{app_data.repo}".colorize(:light_reen)
      puts "-".colorize(:blue) + " Ruby Version:    ".colorize(:light_blue) + " #{ruby_version}".colorize(:light_reen)
      puts
    end

    def directory_not_empty
      puts  ""
      puts "Whoops - need to try again!".colorize(:red)
      puts "The target directory isn't empty."
      puts  ""
    end

    def repo_has_no_tags
      puts  ""
      print "Whoops - need to try again!".colorize(:red)
      puts  ""
      print "We could not find any tags in the repo (".colorize(:light_red)
      print "#{app_data.repo}".colorize(:white)
      print ") on github.".colorize(:light_red)
      puts  ""
      print "HelloRails uses the 'largest' tag in a repository, where tags are sorted alphanumerically.".colorize(:light_red)
      puts  ""
      print "E.g., tag 'v.0.10.0' > 'v.0.9.9' and 'x' > 'a'.".colorize(:light_red)
      print ""
      puts  ""
    end

    def failed_github_request(opts = {})
      puts  ""
      print "Whoops - need to try again!".colorize(:red)
      puts  ""
      print "We could not find (".colorize(:light_red)
      print "#{app_data.repo}".colorize(:white)
      print ") on github.".colorize(:light_red)
      puts  ""
      print "The response from github was a (".colorize(:light_red)
      print "#{opts[:status_code]}".colorize(:white)
      puts  ") which I'm sure you can fix right up!".colorize(:light_red)
      puts  ""
    end

    def success_message
      puts ""
      puts "Your application is ready.".colorize(:yellow)
      puts ""
    end
  end
end
