module Dafuq
  module FileSystem

    # 'remove Vi/Vim Backup/Swap *swp/swo/~ files, leftovers temporary'
    def self.noswap(clean_path, recursive = true)
      Dir.glob(File.expand_path(File.join clean_path, '*')).each do |fyl|
        Dafuq.log_me "Encountered: #{fyl}"
        if File.symlink? fyl
          next
        elsif File.directory?(fyl) && recursive
          Dafuq.log_me "Looking in: #{fyl}"
          noswap(fyl)
        elsif fyl.match(/(\.sw[po]|~)$/)
          begin
            File.delete fyl
            Dafuq.log_me "Deleting: #{fyl}"
          rescue
            Dafuq.log_me "ERROR Deleting: #{fyl}"
            raise
          end
        end
      end
    end
  end
end
