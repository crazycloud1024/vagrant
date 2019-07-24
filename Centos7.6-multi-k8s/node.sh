# 允许 ssh连接
sudo sed  -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo sed  -i "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config
# 关闭selinux
sudo sed  -i "s/SELINUX=enforcing/SELINUX=disabled/" /etc/selinux/config
# 更换软件源 base epel
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.cloud.tencent.com/repo/centos7_base.repo
sudo mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup
sudo curl -o /etc/yum.repos.d/epel.repo http://mirrors.cloud.tencent.com/repo/epel-7.repo
sudo yum makecache && yum update
# 修改root密码
echo 123456 | sudo passwd root --stdin
# 添加默认网关和DNS
sudo sed  -i "1aGATEWAY=192.168.137.1" /etc/sysconfig/network
sudo sed  -i "1aDNS=8.8.8.8" /etc/sysconfig/network
# 安装
sudo yum install python net-tools -y
# 清理缓存重启
sudo yum clean all
sudo reboot
sudo route add default gw 192.168.137.1