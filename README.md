# Collin's BBEdit Package for Ruby

## Preface
Hello friends, Collin here. As I've gotten more into programming Ruby using BBEdit as my editor of choice, I've begun to compile some scripts,  clippings, and other things to make my life easier. I've decided to share the ones I thought would generally be helpful with you here.

## Other Tools
In order to make the scripts here more useful, I recommend installing the following tools:

* [`rbenv`](https://github.com/rbenv/rbenv): Environment manager for Ruby. You will need this for using the 'Generate Tags for Current Ruby' script.
* [`ripper-tags`](https://github.com/tmm1/ripper-tags) or [`Universal Ctags`](https://github.com/universal-ctags/ctags): The tag scripts should work with either, but I recommend installing `ripper-tags` since it's made with Ruby in mind and will give you better results.
* [Rubocop](https://github.com/rubocop/rubocop): Static analyzer and code formatter.

## Scripts

### Generate Tags for Current Ruby
This script generates ctags for your current `rbenv` and saves them into the file `ruby.tags` which BBEdit will then use for completion data and looking up definitions.

### Generate Tags for Bundled Gems
Running this script while your projects **Gemfile** is open in your active editor window will generate ctags for any bundled gems and save them to `gems.tags` in the same directory.

*Note: Make sure you have installed the gems first by running `bundle install` for this to work properly.*

### Lint Document With RuboCop
Lint the current document with RuboCop and display the results in a results browser.

## Text Filters
### Format Document With RuboCop
Reformat the current Ruby document using RuboCop.

## Troubleshooting
You may have trouble if your path is not loading correctly in BBEdit. To get around this, move your path setup code to `~/.zprofile`.

## Installation

You should be able to check this repo out directly into your BBEdit Application Support/Packages folder, and use `git pull` for updates. You can also drag the `.bbpackage` folder there as well.
