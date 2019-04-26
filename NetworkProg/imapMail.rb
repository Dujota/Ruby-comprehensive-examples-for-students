puts <<-EOF
==== Interacting with an IMAP Server ====
  The IMAP protocol is not the prttiest in the world, but it is superior to POP3 in many ways. Messages may be sotred ont eh sever indefinitely.Messages may be stored in hierarchical folders. 
  These two facts alone are enough to estabish IMAP as more powerful than POP3.

EOF

require 'net/imap'

#host = "imap.hogwarts.edu"
#user, pass = "lupin", "riddikulus"
host = "imap.mail.yahoo.co.jp"
user, pass = "solm_sys", "anri0623"

user, pass = "lupin", "riddikulus"

imap = Net::IMAP.new(host, 993)
begin
  imap.login(user, pass)
  puts "complete login"
rescue Net::IMAP::NoResponseError
  abort "Could not login as #{user}"
end

imap.logout

