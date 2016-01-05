role :app, %w{deploy@app02}
set :deploy_to, '/home/deploy/logon'

set :ssh_options, {
  keys: %w(~/.ssh/oplerno),
  forward_agent: true,
  auth_methods: %w(publickey),
}

set :default_env, {
  'DEVISE_SECRET' => ENV['DEVISE_SECRET'],
  'DEVISE_PEPPER' => ENV['DEVISE_PEPPER'],
  'DB' => 'mysql',
  'RAILS_ENV' => fetch(:rails_env),
  'MAIL_PASSWORD' => ENV['MAIL_PASSWORD']
}
