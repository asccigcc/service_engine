require 'serverengine'

module MyWorker
  def run
    until @stop
      logger.info "Awesome work!"
      sleep 1
    end
  end

  def stop
    @stop = true
  end
end

se = ServerEngine.create(nil, MyWorker, {
  daemonize: true,
  log: 'myserver.log',
  pid_path: 'myserver.pid',
})
se.run
