# Pushapp Configuration File

remote :production, 'app@188.166.42.81:/home/app/kraud',
  env: {RAILS_ENV: 'production'}

on :setup do
  task :nginx_export
  rake('db:create db:migrate db:seed')
  rake('assets:precompile', env: {RAILS_GROUP: :assets})
  task(:foreman_export)
end

on :push do
  rake('db:migrate')
  rake('assets:precompile', env: {RAILS_GROUP: :assets})
  task(:upstart_restart) # restarting options[:upstart_jobs]
  task(:unicorn_signal)  # sending USR2 signal to unicorn
end
