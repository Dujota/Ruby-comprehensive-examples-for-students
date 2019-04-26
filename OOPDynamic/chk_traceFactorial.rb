# ruby -disable-gems -r tracer chk_traceFactorial.rb
def factorial(n)
  (1..n).inject(:*) || 1
end

factorial(4)

