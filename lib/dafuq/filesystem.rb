require 'rake'

module Dafuq
  module FileSystem

    # 'remove Vi/Vim Backup/Swap *swp/swo/~ files, leftovers temporary'
    def self.noswap(clean_path, recursive = true)
      clean_path = File.expand_path clean_path
      file_list = FileList["#{clean_path}/#{recursive ? '**/' : ''}.*.{swo,swp}"]
      file_list.each{|file|
        next if File.symlink? file
        begin
          File.delete file
          Dafuq.log_me "Deleting: #{file}"
        rescue
          Dafuq.log_me "ERROR Deleting: #{file}"
          raise
        end
      }
    end
  end
end
