# 允许 ssh连接
sudo sed  -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo sed  -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config
# 关闭selinux
sudo sed  -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
# 更换软件源 base epel pypi清华源
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
sudo mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup
sudo curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
sudo curl -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's+download.docker.com+mirrors.cloud.tencent.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
sudo yum makecache fast && yum update
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 修改root密码
echo 123456 | sudo passwd root --stdin
# 添加默认网关和DNS
sudo sed  -i "1aGATEWAY=192.168.137.1" /etc/sysconfig/network
sudo sed  -i "1aDNS=8.8.8.8" /etc/sysconfig/network
# 安装
sudo yum install python git python-pip vim net-tools zsh docker-ce -y
sudo pip install pip --upgrade -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
sudo pip install ansible==2.6.12 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
# zsh安装
sudo chsh -s /bin/zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# 清理缓存重启
sudo yum clean all
sudo systemctl enable docker
sudo reboot
sudo route add default gw 192.168.137.1