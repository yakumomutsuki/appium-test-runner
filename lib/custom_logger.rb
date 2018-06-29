require 'logger'

class CustomLogger < Logger

  def initialize(logdev)
    super(logdev)
    add(INFO, 'start', nil)
  end

  def backtrace(error)
    add(ERROR, error.class)
    add(ERROR, error.message)
    add(ERROR, error.backtrace)
  end
end