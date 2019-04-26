require 'net/pop'
require 'iconv'

popserver= 'pop.mail.yahoo.co.jp'
username = 'solm_sys'
password = 'anri0623'
port = 995 
# mail_server = Net::POP3.new('mail.mailservernamehere.com')
mail_server = Net::POP3.new(popserver, port)
# set ssl protocol
mail_server.enable_ssl(OpenSSL::SSL::VERIFY_NONE)

begin
	# .start(account, password)
	mail_server.start(username, password)
	if mail_server.mails.empty?
		puts "No mails"
	else
		puts "#{mail_server.mails.length} mails waiting"
		mail_server.mails.each do |m| 
			mail = m.pop
			#puts mail
			subject = m.header.lines.grep /^Subject: /
			#if /ISO_2022/ =~ subject
		      
			#end
			puts subject
			m.delete if mail =~ /Subject: test/i
		end
	end
	mail_server.finish
rescue
	puts "Mail error"
end

#pop.mails.each do |msg| 
#  puts msg.header.lines.grep /^Subject: /
#end
#pop.mails.each do |msg| 
#  if msg.all =~ /.*make money fast.*/
#		msg.delete
#	end
#end
