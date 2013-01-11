require "spec_helper"

describe "rpaf" do
  let(:config_file) { "/etc/apache2/mods-available/rpaf.conf" }

  it { should contain_package("libapache2-mod-rpaf").
              with_ensure("installed").
              with_before(%r[^File.*#{config_file}]) }
  it { should contain_file(config_file).
              with_ensure("present") }

  context "default configuration file" do
    it { should contain_file(config_file).
                with_content(/\A<IfModule rpaf_module>$/) }
    it { should contain_file(config_file).
                with_content(/^RPAFenable On$/) }
    it { should contain_file(config_file).
                with_content(/^RPAFsethostname On$/) }
    it { should contain_file(config_file).
                with_content(/^RPAFproxy_ips 127.0.0.1 ::1$/) }
    it { should contain_file(config_file).
                with_content(/^RPAFheader X-Forwarded-For$/) }
  end

  context "parameters" do
    context "when package is 'rpaf'" do
      let(:params) { {:package => "rpaf"} }
      it { should contain_package("rpaf") }
    end

    context "when config_file is '/etc/rpaf.conf'" do
      let(:params) { {:config_file => "/etc/rpaf.conf"} }
      it { should contain_package("libapache2-mod-rpaf").
                  with_before(%r[^File.*/etc/rpaf.conf]) }
      it { should contain_file("/etc/rpaf.conf") }
    end

    context "when ifmodule is rpaf" do
      let(:params) { {:ifmodule => "rpaf"} }
      it { should contain_file(config_file).
                  with_content(/\A<IfModule rpaf>$/) }
    end

    context "when enable is true" do
      let(:params) { {:enable => true} }
      it { should contain_file(config_file).
                  with_content(/^RPAFenable On$/) }
    end

    context "when enable is false" do
      let(:params) { {:enable => false} }
      it { should contain_file(config_file).
                  with_content(/^RPAFenable Off$/) }
    end

    context "when sethostname is true" do
      let(:params) { {:sethostname => true} }
      it { should contain_file(config_file).
                  with_content(/^RPAFsethostname On$/) }
    end

    context "when sethostname is false" do
      let(:params) { {:sethostname => false} }
      it { should contain_file(config_file).
                  with_content(/^RPAFsethostname Off$/) }
    end

    context "when header is X-Real-IP" do
      let(:params) { {:header => "X-Real-IP"} }
      it { should contain_file(config_file).
                  with_content(/^RPAFheader X-Real-IP$/) }
    end

    context "when proxy_ips contains '1' and '2'" do
      let(:params) { {:proxy_ips => ["1", "2"]} }
      it { should contain_file(config_file).
                  with_content(/^RPAFproxy_ips 1 2$/) }
    end
  end
end
