# vagrant
some vagrant config

添加box帮助：
 - vagrant box add $(下载的离线box文件) --name $boxname
 - vagrant box list ：查看box
 - vagrant box remove ： 删除box
创建使用帮助：
- vagrant ssh ： ssh连接(多台虚拟机 指定host)
- vagrant suspend ： 挂起虚拟机
- vagrant resume ： 启动挂起虚拟机
- vagrant init ： 初始化
- vagrant up ： 启动虚拟机
- vagrant package [--output new_box_name] 打包分发
- vagrant destroy 销毁当前虚拟机
- vagrant reload 重载虚拟机
- vagrant halt 关闭虚拟机
- vagrant snapshot
    - save ${name} 保存快照
    - restore ${name} 恢复快照
    - delete ${name} 删除快照
