# Cheatly

This is a command line toolset to handle the cheat-sheets reposity located at [sheets](https://github.com/arthurnn/cheatly/tree/master/sheets) folder.

This gem is not a fork but inspired by [defunkt/cheat](https://github.com/defunkt/cheat). However instead of using a full server to store the sheets, it uses github as central repository, making more reliable and easy to add new ones.

## Help: Adding a new cheat-sheet

Submit a PR, adding a file to `sheets` folder, with the cheat-sheet name.

1. Fork it
2. `cheatly new name` (replacing name with name of the sheet)
3. Create new Pull Request

## Installation

    $ gem install cheatly

## Usage

### Help

    $ cheatly help

### List all cheat sheets

    $ cheatly list

### Show a cheat sheet

    $ cheatly show gem_release

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/arthurnn/cheatly/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

