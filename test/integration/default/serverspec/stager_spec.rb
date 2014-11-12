require 'spec_helper'


describe file('/opt/stager') do
  it { should be_directory }
end

describe file('/etc/nginx/sites-enabled') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'docker' }
  it { should be_mode 775 }
end

# services we expect to be runnning
stager_services = ['stager', 'nginx']

stager_services.each do |s|
  describe service(s) do
    it { should be_running }
  end
end
