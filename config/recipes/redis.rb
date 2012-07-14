namespace :redis do
  desc "Install redis"
  task :install do
    run "wget http://redis.googlecode.com/files/redis-2.4.12.tar.gz"
    run "tar -zxf redis-2.4.12.tar.gz"
    run "cd redis-2.4.12 && make"
    run "cd redis-2.4.12 && sudo make install"
    #redis.sh
    run "#{sudo} rm -rf /tmp/redis"
    template "redis.sh.erb", "/tmp/redis-server"
    run "#{sudo} mv /tmp/redis-server /etc/init.d/redis-server"
    run "#{sudo} chmod +x /etc/init.d/redis-server"
    run "#{sudo} useradd redis"
    run "#{sudo} mkdir -p /var/lib/redis"
    run "#{sudo} mkdir -p /var/log/redis"
    run "#{sudo} chown redis.redis /var/lib/redis"
    run "#{sudo} chown redis.redis /var/log/redis"
    run "#{sudo} update-rc.d redis-server defaults"
    #redis.conf
    template "redis.conf.erb", "/tmp/redis.conf"
    run "#{sudo} mv /tmp/redis.conf /etc/redis.conf"

    start
  end

  %w[start stop restart force-reload].each do |command|
    desc "#{command} redis"
    task command do
      run "#{sudo} service redis-server #{command}"
    end
  end

end

namespace :deploy do
  desc "Restart Resque Workers"
  task :restart_workers do
    run_remote_rake("resque:restart_workers", true)
  end
end

after "deploy", "deploy:restart_workers"
