# MakeDirsFromList

Create a directory structure from data in a spreadsheet given a directory name template as an argument.

## Installation

Open the terminal and run:

    $ gem install make_dirs_from_list

## Usage

    $ make_dirs_from_list path/to/sheet.xlsx /target/parent/dir "F3_F4"

The directory name template "F3_F4" denotes column placeholders i.e. for each row of the spreadsheet, get data in column 3 and 4 and join together with a "_". The result will be the name of the directory for that row.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DiegoSalazar/make_dirs_from_list.

