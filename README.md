# Dafuq

dafuq is here to handle dafuq tasks required now and then, sometimes and often

## Installation

Add this line to your application's Gemfile:

    gem 'dafuq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dafuq

## Usage

DaFuq

    '-notail', '--no-whitespace'  : Dafuq::Code.notail no_whitespace_path, recurse
    '-noswap', '--no-temp-files'  : Dafuq::FileSystem.noswap no_swap_path, recurse

    '-gpull',  '--git-pull'       : Pull all the git repositories present at path, recurse

    '-no-r', '--no-recurse'       : non-recursive action in directories

    '-v', '--verbose'             : verbose

    log the output to a file
      -l $PATH_TO_LOG_FILE
      --log $PATH_TO_LOG_FILE

.....more to come


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
