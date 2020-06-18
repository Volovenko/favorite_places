# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "my-places.site"
set :repo_url, "git@github.com:Volovenko/favorite-places-hufflepuff.git"
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
