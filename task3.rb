class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

apple = Apple.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

# the code in the shell(s) that copies an object apple from shell one to shell two.

n_apple = Marshal.dump(apple)
obj = Marshal.load(n_apple)
