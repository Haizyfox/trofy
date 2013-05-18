##
# Usage (development):
#   unicorn -c config/unicorn.rb
#
# Usage (production):
#   unicorn --env production -c config/unicorn.rb --daemonize
#
# To restart daemonized Unicorn:
#   kill -USR2 `cat tmp/pids/unicorn.pid `
#
# Heavily inspired by https://github.com/blog/517-unicorn
# See: http://unicorn.bogomips.org/Unicorn/Configurator.html

# doesn't work on heroku
# listen 3000

# doesn't work on heroku
# pid "tmp/pids/unicorn.pid"

if ENV["RACK_ENV"] == "production"
  worker_processes 4
else
  worker_processes 2
end

# Preload the application into the master process before forking.
# Startup will be faster because only the master, not n*workers, will load the app.
# Spawning workers will be insanely fast.
# Care must be taken to reacquire resources like database connections.
# See: http://unicorn.bogomips.org/Unicorn/Configurator.html#method-i-preload_app
preload_app true

# See: http://unicorn.bogomips.org/Unicorn/Configurator.html#method-i-stderr_path
if RACKUP[:daemonize]
  stderr_path "log/unicorn.log"
  stdout_path "log/unicorn.log"
end


# Called by the master process before forking each worker.
before_fork do |server, worker|

  ##
  # "highly recomended" - no need for the master to hold a connection

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

end


# Called by the worker after forking.
after_fork do |server, worker|

  ##
  # The preload_app setting tells the master to load the entire
  # application before working workers.
  # This means resources that cannot be shared must be reacquired.

  ActiveRecord::Base.establish_connection

  ##
  # Upon USR2 signal, Unicorn suffixes its pidfile with .oldbin and
  # immediately start loading up a new version of itself.
  # The final worker gracefully shuts down the old master if running.

  pid_old = "#{server.pid}.oldbin"
  if File.exists?(pid_old) && (worker.nr + 1) == server.worker_processes
    begin
      Process.kill :QUIT, File.read(pid_old).to_i
    rescue Errno::ENOENT, Errno::ESRCH
      # probably already quit
    end
  end

end
