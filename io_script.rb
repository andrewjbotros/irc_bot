puts $stdout.kind_of?(IO)

@stdout = File.open("test.log", "w") # "w" => write, "r" => read, "a" => append

puts "I am going to the file. It is more fun than printing on the console."

$stdout.flush

sleep 50

puts $stdout.equal?(STDOUT)

$stdout = STDOUT

puts "Oh Em Gee, I am back on the console."

# system('ls -l')
# system('echo Wheeee')