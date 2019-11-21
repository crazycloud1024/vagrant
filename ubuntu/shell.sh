# 允许 ssh连接
sudo sed  -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo sed  -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config
# 关闭selinux
sudo sed  -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
# 更换软件源 base epel pypi清华源
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo curl -o /etc/apt/sources.list  http://mirrors.cloud.tencent.com/repo/ubuntu14_sources.list
sudo apt-get update
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 修改root密码
echo 123456 | sudo passwd root --stdin
# 添加默认网关和DNS
sudo sed  -i "1aGATEWAY=192.168.137.1" /etc/sysconfig/network
sudo sed  -i "1aDNS=8.8.8.8" /etc/sysconfig/network
# 安装
sudo apt-get install python git python-pip vim net-tools zsh -y
sudo pip install pip --upgrade -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
# zsh安装
sudo chsh -s /bin/zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# 清理缓存重启
sudo apt-get autoremove && apt-get distclean
sudo reboot
sudo route add default gw 192.168.137.1
