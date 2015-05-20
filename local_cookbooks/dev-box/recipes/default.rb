
puts "creating .gemrc"

file "#{ENV['HOME']}/.gemrc" do
  content 'gem: --no-rdoc --no-ri'
end