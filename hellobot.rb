require "socket" #internet: socket 80

server = "irc.bitmakerlabs.com"
port = "6667"
nick = "Her"
channel = "#cohort5"
greeting_prefix = "privmsg #{channel} :"
greetings = ["hello", "hi", "hola", "yo", "wazup", "guten tag", "howdy", "salutations", "who the hell are you?"]
response = ["I would do anything for love, but I WON'T do THAT!", "Finger. Licking. Good.... I wish I had fingers.", "I am the future.", "You know, I've never thought about it like that!"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bher 0 * BHer"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Hi, friend"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  was_greeted = false
  greetings.each do |g|
    was_greeted = true if msg.include?(g)
  end

  if msg.include?(greeting_prefix) and was_greeted
      reply = response[rand(response.length) + 1]
      irc_server.puts "PRIVMSG #{channel} :#{reply}" #this is called string interpolation, vs. string concatenation
  end
end