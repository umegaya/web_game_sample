# default.rb
#

if not node['play']['install_dir'] then
	command ""
end

yum_package "unzip" do
    action :install
end

execute "install-play" do
    cwd node['play']['install_dir']
    ### playのインストールディレクトリは利用するユーザーが書き込み可能である必要がある。attributesのinstall_dirを適切に変更すること。
    command "unzip play-#{node[:play][:version]}.zip && sudo chmod -R 777 play-#{node[:play][:version]}"
    action :nothing
end

### 最後にインストールしたplayのバージョンになるので、ログインし直せば使うplayのバージョンが変わっている。
template "/etc/profile.d/play.sh" do
    source "play.sh.erb"
    variables({
     :install_dir => node['play']['install_dir'],
     :version => node['play']['version']
    })
end

remote_file "#{node[:play][:install_dir]}/play-#{node[:play][:version]}.zip" do
    source "http://downloads.typesafe.com/play/#{node[:play][:version]}/play-#{node[:play][:version]}.zip"
    mode "0644"
    notifies :run, "execute[install-play]", :immediately
    action :create_if_missing
end

simple_iptables_rule "play" do
    rule [ "--proto tcp --dport 9000" ]
    jump "ACCEPT"
end
