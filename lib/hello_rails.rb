require 'forwardable'
require 'ostruct'
require 'optparse'
require 'colorize'
require 'net/http'
require 'json'
require 'fileutils'

require 'hello_rails/version'
require 'hello_rails/runner'
require 'hello_rails/starter_repo'
require 'hello_rails/cli_handler'
require 'hello_rails/string_utils'
require 'hello_rails/unix_utils'
require 'hello_rails/app'
require 'hello_rails/messenger'
require 'hello_rails/app_data'
require 'hello_rails/app_installer'
require 'hello_rails/tag_manager'

module HelloRails
  def self.run
    runner.run
  end

  private

  def self.runner
    Runner.new
  end
end
