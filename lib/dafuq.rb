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

  def self.is_this
    Dafuq.verbose = Arg0::Console.switch?(['-v', '--verbose'])
    Dafuq.log     = Arg0::Console.value_for(['-l', '--log']).join
    recurse       = ! Arg0::Console.switch?(['-no-r', '--no-recurse'])

    Arg0::Console.value_for(['-notail', '--no-whitespace']).each do |no_whitespace_path|
      Dafuq::Code.notail no_whitespace_path, recurse
    end
  end
end
