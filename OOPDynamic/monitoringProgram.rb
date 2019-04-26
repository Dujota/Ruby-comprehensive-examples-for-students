#! /usr/bin/ruby -w
def factorial(n)
	(1..n).inject(:*) || 1
end

@call_depth = 0

TracePoint.trace(:a_call) do |tp|
	@call_depth += 1
	print "#{tp.path}:#{sprintf("%-4d", tp.lineno)} #{"  " * @call_depth}"
	puts  "#{tp.defined_class}##{tp.method_id}"
end

TracePoint.trace(:a_return) do |tp|
	print "#{tp.path}:#{sprintf("%-4d", tp.lineno)} #{"  " * @call_depth}"
	puts  "#{tp.defined_class}##{tp.method_id} => #{tp.return_value}"
	@call_depth -= 1
end

factorial(4)
