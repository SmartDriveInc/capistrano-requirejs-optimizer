require 'json'

module Capistrano
  class FileNotFound < StandardError
  end
end

namespace :deploy do
  namespace :requirejs_optimizer do

    desc 'Run optimization'
    task :run do
      on release_roles(fetch(:requirejs_optimizer_roles)) do
        execute(:node, fetch(:rjs_recursive_script_name), fetch(:requirejs_optimizer_config).map{|k,v| "--#{k}=#{v}"}.join(' '))
      end
    end

    desc 'Setup rjs-recursive'
    task :executable do
      on release_roles(fetch(:requirejs_optimizer_roles)) do
        out = execute("if [ -e '#{fetch(:rjs_recursive_working_dir)}/#{fetch(:rjs_recursive_task_name)}' ]; then echo -n 'true'; fi")
        execute(:pwd, '&&', :cd ,fetch(:rjs_recursive_working_dir), '&&', :git, 'clone', fetch(:rjs_recursive_url)) if out != 'true'

        execute(
          :pwd,
          '&&',
          :cd, "#{fetch(:rjs_recursive_working_dir)}/#{fetch(:rjs_recursive_task_name)}",
          '&&',
          :git, 'fetch',
          '&&',
          :git, "reset --hard origin/#{fetch(:rjs_recursive_branch)}",
          '&&',
          SSHKit.config.command_map[:npm], 'install'
        )
      end
    end
  end

  before 'deploy:updated', 'requirejs_optimizer:executable'
  before 'deploy:updated', 'requirejs_optimizer:run'
end

namespace :load do
  task :defaults do
    set :requirejs_optimizer_config, {
      :base_url => nil,
      :require_config_path => nil,
      :main_config_root_path => 'main',
      :out => 'builds'
    }
    set :rjs_recursive_task_name, 'rjs-recursive'
    set :rjs_recursive_url, "https://github.com/SmartDriveInc/rjs-recursive.git"
    set :rjs_recursive_working_dir, -> { "#{fetch(:release_path)}/../../shared" }
    set :rjs_recursive_script_name, -> { "#{fetch(:rjs_recursive_working_dir)}/#{fetch(:rjs_recursive_task_name)}/bin/optimizer" }
    set :rjs_recursive_branch, 'master'
  end
end
