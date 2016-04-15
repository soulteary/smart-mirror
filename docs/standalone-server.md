# 服务器使用

出于各种目的，我们期望Node.js的Dist镜像可以被固化在我们自己的服务器上。

这里以```Digital Ocean```最低配虚拟机(Ubuntu 14.04)为例。

先更新系统，并安装```git```：

```
sudo apt-get update -y
sudo apt-get install git -y
```

接着将工具通过```clone```的方式下载到服务器：

```
git clone https://github.com/soulteary/smart-mirror.git
```

进入目录，执行脚本即可。

```
cd smart-mirror/
bash ./smart-mirror
```



