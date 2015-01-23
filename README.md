# capistrano-requirejs-optimizer
A capistrano task for r.js optimization.

* `requirejs_optimizer:executable`
* `requirejs_optimizer:run`

#### Some requirejs-optimizer specific options.
* `requirejs_optimizer_config<Hash>`
  - `base_url<string>` Base url
  - `require_config_path<string>` Path for require config
  - `main_config_root_path<string>` Path for mainConfigRoot dir
  - `out<string>` Path for destination
  - `withoutOptimize<string>` yes or nor

* `rjs_recursive_url` rjs's repostiroty url
* `rjs_recursive_working_dir` Directory path for rjs_recursive installation
* `rjs_recursive_script_name` Script name for rjs_recursive
* `rjs_recursive_branch` Branch name for rjs_recursive

## Installation
Add this line to your application's Gemfile.

```ruby
gem 'capistrano',  '~> 3.2'
gem 'capistrano-requirejs-optimizer', :git => 'https://github.com/SmartDriveInc/rjs-recursive.git', :branch => 'master'
```

## Usage
Add this line to your application's Capfile.

```ruby
# Capfile
require 'capistrano/requirejs-optimizer'
```
