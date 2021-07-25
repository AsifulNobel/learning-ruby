def call_hello_world_block(&block)
  # Calls the given code block
  block.call if block_given?
end

def add_by(addend)
  # Returns a callable proc
  proc { |x| x + addend }
end

def add_by_lambda(addend)
  # Returns a callable lambda proc
  ->(x) { x + addend }
end

def proc_and_lambda_return
  a_lambda = -> { return }
  a_lambda.call
  puts 'Returned from lambda'

  # Proc return means exit from calling method
  # This is dangerous
  a_proc = proc { return }
  a_proc.call
  puts 'Cannot see this message'
end

if __FILE__ == $PROGRAM_NAME
  # Instantiates a callable object
  print_hello_world = Proc.new { puts 'Hello World!' }
  print_hello_world.call # Calls the object

  # Uses Kernel#proc method to mimic Proc.new
  print_hello_world22 = proc { puts 'Hello World!' }
  print_hello_world22.call

  call_hello_world_block { puts 'Hello World!' }

  # Using Proc as code block
  [1].each(&print_hello_world)

  puts add_by(3).call(4) # 7

  # Restrictive proc aka lambda
  hello_lambda = -> { puts 'Hello Lambda!' }
  hello_lambda.call

  proc_and_lambda_return

  puts add_by_lambda(3).call(4)
end
