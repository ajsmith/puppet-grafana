require 'spec_helper.rb'

describe 'grafana::docker::image_config' do
  context 'common usage' do
    let(:params) {
      {
        :docker_dir   => '/home/frodo/docker-grafana',
      }
    }

    it { should compile }
    it { should contain_file('/home/frodo/docker-grafana/grafana.ini') }
  end
end
