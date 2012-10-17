class CallerClass
  def test
    start = Time.now
    yield
    puts Time.now - start
  end 
end
