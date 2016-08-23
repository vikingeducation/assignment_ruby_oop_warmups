require "./warmup.rb"

describe "reverse method" do
  it "reverses a given string" do
    expect(my_reverse("Blah!")).to eq("!halB")
  end
end

describe "fibonacci method" do
  it "gives the fibonacci sequence of a given length" do
    expect(fib(8)).to eq([0, 1, 1, 2, 3, 5, 8, 13])
  end

  it "returns an empty array given zero" do
    expect(fib(0)).to eq([])
  end
end

describe "benchmark" do
  it "returns zero given an empty block" do
    expect(benchmark {}).to be_within(0.1).of(0)
  end

  it "returns within 0.1  of 0 given a single method" do
    expect(benchmark {arr = Array.new}).to be_within(0.1).of(0)
  end

  it "returns the total time" do
    expect(benchmark(10000) {i = 7}).to be_within(0.1).of(0)
  end
end

describe "my_each method" do
  it "returns the answer for a given block" do
    expect([1,2,3,4].my_each{|thing| puts thing})
  end

  it "takes a proc" do
    my_proc = Proc.new{|item| puts item**2}
    expect([1,2,3,4].my_each(my_proc))
  end
end

describe "my_inject method" do
  it "returns the sum given a sum block" do
    expect([1,2,3,4].my_inject(0) {|total, item| total + item}).to eq(10)
  end

  it "returns the times given a times block" do
    expect([1,2,3,4].my_inject(1) {|total, item| total * item}).to eq(24)
  end

  it "takes a proc" do
    my_proc = Proc.new{|total, item| total ** item}
    expect([1,2,3,4].my_inject(2,my_proc)).to eq(16777216)
  end
end
