# Dafuq::Git
require 'rake'

module Dafuq
  module Git

    #
    def self.repos(path, recursive=true)
      path = File.expand_path path
      git_configs = FileList["#{path}/#{recursive ? '**/' : ''}.git/config"]
      git_configs.pathmap("%d").pathmap("%d")
    end

    # 
    def self.pull(base_path, recursive = true)
      repos(base_path).each{|repo|
        begin
          pid = spawn("cd #{repo} ; git pull ; cd -")
          Dafuq.log_me "Updating: #{repo}; PID##{pid}"
        rescue
          Dafuq.log_me "ERROR: updating repo at #{repo}"
          raise
        end
      }
    end
  end
end
