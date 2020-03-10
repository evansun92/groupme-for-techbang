role :app, %w{app@52.199.153.254}, my_property: :my_value
role :web, %w{app@52.199.153.254}, other_property: :other_value
role :db,  %w{app@52.199.153.254}

set :branch, ENV['BRANCH”'] || `git rev-parse --abbrev-ref HEAD`.chop