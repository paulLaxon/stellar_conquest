module GamesHelper
  def rc_to_label(row, col)
    text = col + 1 > 26 ? "A#{(((col + 1) % 26) + 64).chr}" : (col + 65).chr
    num = (row + 1).to_s
    num = "0#{num}" if num.size == 1
    text + num
  end

  def cloud?(location)
    # @board[location][:cloud]
  end

  def star?(location)
    # return true if @board[location][:star].present?

    # false
  end

  # Check if Win32API is accessible or not
  USE_STTY = begin
    require 'Win32API'
    KBHIT = Win32API.new('crtdll', '_kbhit', [], 'I')
    GETCH = Win32API.new('crtdll', '_getch', [], 'L')
    false
  rescue LoadError
    # Use Unix way
    true
  end

  # Return the ASCII code last key pressed, or nil if none
  #
  # Return::
  # * _Integer_: ASCII code of the last key pressed, or nil if none
  def self.getkey
    return KBHIT.Call.zero? ? nil : GETCH.Call unless USE_STTY

    char = nil
    begin
      system('stty raw -echo') # => Raw mode, no echo
      char = begin
        $stdin.read_nonblock(1).ord
      rescue StandardError
        nil
      end
    ensure
      system('stty -raw echo') # => Reset terminal mode
    end
    char
  end
end
