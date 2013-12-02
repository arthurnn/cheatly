# Ruby exceptions

* Exception
  - NoMemoryError
  - ScriptError
    + LoadError
    + NotImplementedError
      * SyntaxError
  - SignalException
    + Interrupt
      * Timeout::Error    # require 'timeout' for Timeout::Error
  - StandardError         # caught by rescue if no type is specified
    + ArgumentError
    + IOError
      * EOFError
    + IndexError
     * LocalJumpError
    + NameError
      * NoMethodError
    + RangeError
      * FloatDomainError
      * RegexpError
    + RuntimeError
      * Timeout::Error    # moved here in ruby 1.9.2
    + SecurityError
    + SocketError
    + SystemCallError     # Errno::* inherits here
    + SystemStackError
    + ThreadError
    + TypeError
    + ZeroDivisionError

    + SystemExit
* fatal
