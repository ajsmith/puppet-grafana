require 'spec_helper.rb'

describe 'grafana::docker::image_config' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should contain_file('/opt/docker-grafana/grafana.ini') }
  end
end
