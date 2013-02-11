module Dafuq
  module Code

    # 'remove tailing whitespace'
    def self.notail(edit_path, recursive = true)
      Dir.glob(File.expand_path(File.join edit_path, '*')).each do |fyl|
        if File.symlink? fyl
          next
        elsif File.directory?(fyl) && recursive
          notail(fyl)
        else
          Dafuq.log_me "Processing: #{fyl}"
          %x{sed -i 's/\ *$//g' #{fyl}}
        end
      end
    end
  end
end
