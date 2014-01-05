# Dafuq

dafuq_all = File.join(File.dirname(File.expand_path __FILE__), '*', '*.rb')
Dir.glob(dafuq_all).each {|lib| require lib}

module Dafuq

  class << self
    attr_accessor :verbose, :log
  end

  def self.log_me(msg)
    puts "[+] #{msg}" if @verbose
    File.open(@log, 'a+'){|fyl| fyl.puts msg} if File.exists?(@log)
  end

  def self.is_this(effin_path)
    Dafuq.verbose = Arg0::Console.switch?(['-v', '--verbose'])
    Dafuq.log     = Arg0::Console.value_for(['-l', '--log']).join
    recurse       = ! Arg0::Console.switch?(['-no-r', '--no-recurse'])

    if Arg0::Console.switch?(['-notail', '--no-whitespace'])
      Dafuq::Code.notail effin_path, recurse
    end

    if Arg0::Console.switch?(['-noswap', '--no-temp-files'])
      Dafuq::FileSystem.noswap effin_path, recurse
    end

    if Arg0::Console.switch?(['-gpull', '--git-pull'])
      Dafuq::Git.pull effin_path, recurse
    end
  end
end
