# algoheader

Programmatically generate beautiful header images for blogs or social media accounts.

## Table of Contents
* About
* Getting started
    * Installation
    * Usage
* Contributing
    * Code of Conduct
    * Code Style
    * Documentation
    * Testing
* TODO
* Changelog

## About

Programmatically generate beautiful header images for blogs or social media accounts.

Documentation can be found [here](https://d3d1rty.github.io/algoheader/).

## License

See `LICENSE` in the project root directory for license information.

## Getting Started

### Installation

Execute command `gem install algoheader` to install.

### Usage

Executing `algoheader` with no options will generate a config file in your `$XDG_CONFIG_HOME` directory with
a default color scheme information as well as 50 SVG files with various designs.

To get a full list of options, execute command:

```bash
algoheader -h
```

For example, the following command will use the specified config file to generate 42 SVGs and associated PNGs
to the specified output directory:

```bash
algoheader --config config.yml --directory output/ --images 42 --raster

# Shorthand
algoheader -c config.yml -d output/ -i 42 -r
```

## Contributing

### Code of Conduct

All contributions are welcome, but are merged at the discretion of the core
contributor(s). Contributions to the project will be
judged on their merits without respect to a contributor's publicly or
privately held beliefs, opinions, ideology, nationality, ethnicity, or
demographic. Most communications within the project should be limited to
project planning, development, bugfixing, or other relevant topics; for
off-topic discussions, contributors are expected to use good judgement
and to avoid intentionally abusive behavior. Conflict should be resolved
at the lowest level possible with minimal disruption to the project. Core
contributor(s) reserve the right to request that a contributor alter their
behavior, however, nothing in this code of conduct should be construed in
such a manner that it infringes upon any contributor's freedom of expression.

### Code Style

To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

### Documentation

Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    [Author Information]
# Copyright:: Copyright [Year] [Author Information]
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

Documentation should be regenerated prior to merging any branches into master. The latest
[documentation](https://d3d1rty.github.io/algoheader/) auto-sources off the `docs/` folder on
the master branch. For more information on RDoc, go
[here](https://rdoc.github.io/rdoc/index.html).

```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing

**NOTE**: The test suite has yet to be implemented.

Integration tests should be written for all classes and methods. The test suite
can be run manually `bundle exec rake test` or automatically using guard `bundle exec guard`.

## TODO

* Implement test suite.

## Changelog

### 12-OCT-2021

* Released initial version `0.0.1`.
