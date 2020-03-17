worker_processes 2

listen '/home/app/groupme-for-techbang/shared/tmp/sockets/unicorn.sock'
pid '/home/app/groupme-for-techbang/shared/tmp/pids/unicorn.pid'

stderr_path 'log/unicorn.error.log'
stdout_path 'log/unicorn.log'

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

    old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defind?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end