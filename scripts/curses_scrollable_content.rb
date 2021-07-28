# frozen_string_literal: true

require 'curses'

include Curses

$lines_scrolled = 0
def safe_exit
  close_screen
  exit
end

def move_cursor_up(window, data)
  if window.cury > 0
    window.setpos(window.cury - 1, window.curx)
  else
    current_x = window.curx
    current_y = window.cury
    window.clear
    $lines_scrolled -= 1 if $lines_scrolled > 0
    window << data.slice($lines_scrolled * cols, lines * cols)
    window.setpos(current_y, current_x)
  end
end

def move_cursor_down(window, data)
  if window.cury < lines - 1
    window.setpos(window.cury + 1, window.curx)
  else
    current_x = window.curx
    current_y = window.cury
    window.clear
    window << data.slice((cols - 1) + ($lines_scrolled * cols), lines * cols)
    window.setpos(current_y, current_x)
    $lines_scrolled += 1 if data.length > ((lines * cols) + (($lines_scrolled - 10) * cols))
  end
end

def move_cursor_left
  if stdscr.curx > 0
    stdscr.setpos(stdscr.cury, stdscr.curx - 1)
  end
end

def move_cursor_right
  if stdscr.curx < cols - 1
    stdscr.setpos(stdscr.cury, stdscr.curx + 1)
  end
end

if __FILE__ == $PROGRAM_NAME
  init_screen
  raw
  noecho
  stdscr.keypad(true)

  input_file_path = File.join('data', 'dummy_text2.txt')
  data = ''

  File.open(input_file_path, 'r') { |file| data = file.read }

  stdscr << data.slice(0, lines * cols) # buffer size is not optimized at all, but that's okay

  while (user_input = getch)
    case user_input
    when KEY_UP
      move_cursor_up(stdscr, data)
    when KEY_DOWN
      move_cursor_down(stdscr, data)
    when KEY_LEFT
      move_cursor_left
    when KEY_RIGHT
      move_cursor_right
    when KEY_HOME
      stdscr.setpos(stdscr.cury, stdscr.begx)
    when KEY_END
      stdscr.setpos(stdscr.cury, stdscr.maxx - 1)
    when KEY_RESIZE
      current_x = stdscr.curx
      current_y = stdscr.cury
      stdscr.clear
      stdscr << data.slice((cols - 1) + ($lines_scrolled * cols), lines * cols)
      stdscr.setpos(current_y, current_x)
    when 3
      safe_exit
    else
      next
    end
  end
end
