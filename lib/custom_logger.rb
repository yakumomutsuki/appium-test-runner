require 'logger'

# CustomLogger Class is a Extends of Logger Class.
#
# Under the methods are Added.
#  :initialize
#  :backtrace
#  :close
class CustomLogger < Logger
  # Call the constructor and outputs 'start' to log.
  def initialize(logdev)
    super(logdev)
    add(INFO, 'start', nil)
  end

  # Receives error object and outputs backtrace to log.
  def backtrace(error)
    add(ERROR, error.class)
    add(ERROR, error.message)
    add(ERROR, error.backtrace)
  end

  # Call the overridden method and  and outputs 'end' to log
  def close
    add(INFO, 'end', nil)
    super
  end
end