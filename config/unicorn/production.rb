worker_processes 2

listen '/home/app/groupme-for-techbang/shared/tmp/sockets/unicorn.sock'
pid '/home/app/groupme-for-techbang/shared/tmp/pids/unicorn.pid'

stderr_path 'log/unicorn.error.log'
stdout_path 'log/unicorn.log'