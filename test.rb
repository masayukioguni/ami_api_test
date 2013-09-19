require 'aws-sdk'

#EC2
if ENV['EC2_URL']
  ec2=AWS::EC2.new(:ec2_endpoint => ENV['EC2_URL'].sub(/^https?:\/\//,""))
else
  ec2=AWS::EC2.new
end

instances = ec2.instances.select {|instance| instance.status == :running}.map(&:private_ip_address)
instances.each {|instance| p instance}