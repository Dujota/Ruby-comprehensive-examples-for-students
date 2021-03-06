class Sem
  include DRbUndumped
  def initialize(ts, n, name=nil)
    @ts = ts
    @name = name || self
    n.times { up }      # n times count up semaphor
  end
  attr_reader :name

  def synchronize
    succ = down
    yield
  ensure
    up if succ
  end

private
  def up
    @ts.write(key)
  end

  def down
    @ts.take(key)
    return true
  end

  def key
    [@name]
  end
end
