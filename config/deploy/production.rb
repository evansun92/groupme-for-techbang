role :app, %w{app@52.199.153.254}
role :web, %w{app@52.199.153.254}
role :db,  %w{app@52.199.153.254}

set :branch, ENV[“BRANCH”] || `git rev-parse --abbrev-ref HEAD`.chop

set :ssh_options, {
  user: 'app',
  forward_agent: true
}