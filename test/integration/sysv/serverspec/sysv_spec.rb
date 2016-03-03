require 'spec_helper'
require 'service_dependency_helper'

describe service("sensu-server") do
  it { should be_enabled }
  it { should be_running }
end

describe service("sensu-client") do
  it { should be_enabled }
  it { should be_running }
end

describe service("sensu-api") do
  it { should be_enabled }
  it { should be_running }
end

describe file("/etc/sensu/conf.d") do
  it { should be_directory }
end

describe file("/etc/sensu/conf.d/checks") do
  it { should be_directory }
end

describe file("/etc/sensu/conf.d/client.json") do
  it { should be_file }
  it { should be_grouped_into "sensu" }
  its(:content) { should match /"name": / }
  its(:content) { should match /"warning": 60/ }
end

describe file("/etc/sensu/conf.d/checks/test.json") do
  it { should be_file }
  it { should be_grouped_into "sensu" }
  its(:content) { should match /"command": "true"/ }
  its(:content) { should match /"interval": 10/ }
end
