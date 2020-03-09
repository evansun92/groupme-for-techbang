server "52.199.153.254", user: "deploy", roles: %w{app db web}

set :rails_env, 'production'

set :deploy_to, '/home/app/groupme-for-techbang'

role :app, %w{app@52.199.153.254}, my_property: :my_value
role :web, %w{app@52.199.153.254}, other_property: :other_value
role :db,  %w{app@52.199.153.254}

set :ssh_options, {
  user: 'app',
  forward_agent: true
}