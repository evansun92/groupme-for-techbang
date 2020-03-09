server "13.114.19.158", user: "deploy", roles: %w{app db web}

set :rails_env, 'production'

set :deploy_to, '/home/app/groupme-for-techbang'

role :app, %w{app@13.114.19.158}, my_property: :my_value
role :web, %w{app@13.114.19.158}, other_property: :other_value
role :db,  %w{app@13.114.19.158}

set :ssh_options, {
  user: 'app',
  forward_agent: true
}