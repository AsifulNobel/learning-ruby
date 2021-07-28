# frozen_string_literal: true

require 'curses'

# Initializes a terminal screen
Curses.init_screen

# Sets terminal input mode to row, which stops the terminal from buffering and auto-translating interrupt, suspend, line feed signals
Curses.raw

# User input is not echoed
Curses.noecho

# Hitting enter does not give a new line
Curses.nonl
Curses.curs_set(0) # Makes the cursor invisible
Curses.stdscr.keypad = true # Makes the arrow-keys and function keys available for processing

# Below two options enable scrolling down when cursor reaches the end of visible region
Curses.stdscr.idlok(true)
Curses.stdscr.scrollok(true)

at_exit do
  Curses.close_screen
end

menu_items = [
  Curses::Item.new('Apple', 'Red fruit'),
  Curses::Item.new('Orange', 'Orange fruit'),
  Curses::Item.new('Banana', 'Yellow fruit'),
  Curses::Item.new('Mango', 'Green fruit')
]
menu = Curses::Menu.new(menu_items)

# Sets how many lines and columns a 'menu' can take
# The lines and columns have nothing to do with window lines and columns
menu.set_format(2, 1) # Displaying two items, enables scrolling automatically
menu.opts_off(Curses::O_SHOWDESC) # Don't show description
menu.post

# scale returns how many window lines and columns a menu will take to render
first_empty_line = menu.scale.first
Curses.setpos(first_empty_line, 0)
Curses.stdscr << menu.scale.to_s

first_empty_line += 1 # This can become more than available terminal window lines

menu_items.last.opts_off(Curses::O_SELECTABLE) # Last menu item does not get highlighted, when selected

while (ch = Curses.getch)
  Curses.setpos(first_empty_line, 0)
  Curses.stdscr.clrtoeol
  Curses.stdscr << menu.current_item.name.to_s
  first_empty_line += 1

  begin
    case ch
    when Curses::KEY_UP, 'k'
      menu.up_item
    when Curses::KEY_DOWN, 'j'
      menu.down_item
    when Curses::KEY_LEFT, ?l # ?l denotes character literal of l
      menu.left_item
    when Curses::KEY_RIGHT, ?h
      menu.right_item
    else
      break
    end
  rescue Curses::RequestDeniedError
  end
end

menu.unpost
