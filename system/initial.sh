#!/bin/bash

anynowtime="date +'%Y-%m-%d %H:%M:%S'"
NOW="echo [\`$anynowtime\`][PID:$$]"

##### 可在脚本开始运行时调用，打印当时的时间戳及PID。
function job_start
{
    echo "`eval $NOW` job_start"
}

##### 可在脚本执行成功的逻辑分支处调用，打印当时的时间戳及PID。 
function job_success
{
    MSG="$*"
    echo "`eval $NOW` job_success:[$MSG]"
    exit 0
}

##### 可在脚本执行失败的逻辑分支处调用，打印当时的时间戳及PID。
function job_fail
{
    MSG="$*"
    echo "`eval $NOW` job_fail:[$MSG]"
    exit 1
}

job_start

###### 可在此处开始编写您的脚本逻辑代码

if  grep -r 'kingnet' /etc/passwd ; then
echo '系统已经初始化过，请检查后再执行该脚本！！！！'
echo '初始化脚本已退出~~~！！！！！'
exit 0
fi

if [ ! -d /root/.ssh ];then
    mkdir /root/.ssh/ && chmod 700 /root/.ssh/
fi

cat >> /root/.ssh/authorized_keys << end
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA3kcfbdvUb1/hHK0vXnE93VELFxKdxFzK1BjDzraW/ZEdX6obmPoOW221GOIqP/kOEJq26ycvTkN218feWlbugIkb4t5xuwjV9azI/cpus2FnCsPkoIctdOQZwLBkMkZjUT9SabTBjKWWoUNfJHncMJ8abC0UukvDg36o8HZWjv0= bixuan@bixuandeibook-g4.local
ssh-dss AAAAB3NzaC1kc3MAAACBAIZpwo7kUsr5vrS70gxU/efJcHoxq8GCp0eB9Bplm1UaHOGoVMcTDD7ww7QVpWhrk206tg/TKxhJ4F1cnF6N/fJx5CR5itQ1yxlBia/X+f2OfDHPwEXYLulKTTtgI9wY+0dFokg8K72ZgRL8n6jJODMMLvhht1c+Yl4g7Cqpx/pdAAAAFQCbtr3MaRtR5rN3eELRWaC+7ArZvwAAAIAgmnlHWqAKQzCvyGehUb03NovjyPThAp6ZP3zA5hconScV7/R36s5XdLvz7GUnGCVwqh+mRp5JH00Qz6rqVzgTxeG5Ju2OOfD/RE3kFKVYkjhDZJyAisyDeEHmW12Rs8GqJmQknmEN+QoQieUdlEN7X3mRhHjhZ5NGGej7Qic1agAAAIAKiG6I6ZI/2CwbSxwjswAm6/uLcmdNq/HPzRzU4Md9OmZoyj0jlfIxDQhauXXEhkjer1cWmrbotwGY+7Y8vP6o00RiZibVScNxqho1jHr4oR8k1OY9lj4OGbcTEeTK4saptGVGPSzZC0aPv3CMYgFl7UcNu+MFLiusgjqJU/MR/g== lieo@lieotekiMacBook-Pro.local
ssh-dss AAAAB3NzaC1kc3MAAAEBAJ/jvc4/PGPvtSal3mMSJfFPdzdwYshjvwEVI4dn95q9526I/jYy5/LH/GjqZ83bMyBmvDvKkZaTE4YQ5c3LndgSkxIzsWp6YikTErDVCBfJPqDNr08snYLoPu83bVV0UGefDmb/5+d2XmPop/SAcwVakM0xBmy0xC1XdwU92/sNqrOZo1U0jOyNR+jwAW6hMYvT0gE/Aa2QCcFB0JDfFPUqNrCEsIgcQ1JrvyGxaxeixVmkj/oJ+bwkdwlb6+f8NCWIrMrbCUeWedAnY4GeDCRbmQjR5bk9Wq/UVAnQ+0utjRi8yDf3sV75zaaxyKcbJ5fzKNwPITDFMyIhNRd3K7MAAAAVAIwty4iRSIkXaCp7K5/yiQq1lNJjAAABAGwd8IIU3wN0M5F4tchtxNJ6Xd+f70g6ugpox8LSlPYYHvFqJl7zmJyEY7KJ724NJiCE6XKiq7kdI1XxkxMJERnKr8pvXZ+Y6w5tP0+uKdelm/KthUvsuydXJIHyoJd8UDIY6HlEtK7tV8/NEF8eS/8UTvM4xl5B6JeKXfpD7MV5xyaiZbzUbelu3fdxJhglflg42UQvTAOMjnKuzpa5ExjsJNTFR0Q+wJSYUg+G0VtwdqKNd93zUEhYrJRsQiicNGWwXaSYZlamcI7ClUTXEl7MLk59EUmcJMC6+c0uZfhPH8D7jYjOzN7MTWnCwlBcluC/6ECCORlNo2pjM5Rx8VgAAAEAOMAMgvhnXJSSYMkKXubpbkb96NLt2yhwhw6tJtQavgdgCPUgQZMsrUeJjWB+puwxSDVMgKDnfMgDBoBGggNPsxkkJujijrs7ZCViM7UKYuA3QYzkIXykg2sCbQ0F6pkT5oHuUSWjXvo71hvSRX4ysr1HYGi1o+RNdowza8KqjJUF0M9qcFftmrtpAtK/obumwndttkRE2hzDx+tDTAF8l9yBJU1faWY04WzYqYmMvpqageTI4dsTuUQyiGEI5/qLO7zWnjQp+jw6xRHq2Qc7xt5Jl+DBazb4hC3VQfhRfjJ38vA5tovxYVPnAMuqdntNRGnQsuSafAYGAFhrVVR1KQ== chaiqg@kingnet.com
ssh-dss AAAAB3NzaC1kc3MAAACBAIvc/vr6x1WQkjmJdiuIZH0i8M/asIrLZc/sx2jEHc2odk5UKdc9fk8Ikz8vFjwj0wMFRNWvqowOSo869PsME3fpeF6f3OarD0L4YxR1yKavYj8xCBWd/ObLUkhC3t1idS4OX4jqKDfusbiO5tqWDOTjKha7dE6kit3krJc9R1ejAAAAFQCygoMF6XtLUC/AlqdLOBEOptFRpwAAAIBXfb5Cmqi06fbQs2yb+IXsUeXVB8oosGKbG5uQt1IQL+e92XT13ly+9/esqFmN0t5o8i/ueZ5JvhsifVs+8I00g/wq9HKD5ekKi1p3Evs2Hsle1gxE3tTsX/kLWw9iFjmTCAYwc7ssLuxBkRGOUoWywZs9ITe7hVnw/JMRId/3EgAAAIAV1ly3yZdd5Gp1D4qEg4FogrS8GKaFaVkMvVEhTeUEdSrA/h76kOddTZbXYLkwmlOSc5m/UMCoNbUTBFM6CT8peSCPO/atTYPRJpuZXtR3907yECcxgO642CcHWemt7o1MjyU8R2iELpEPgGQ3kTK6MOf+Mf21r/McLKTRtShYOQ== sunss@kingnet.com
ssh-dss AAAAB3NzaC1kc3MAAACBAIZpwo7kUsr5vrS70gxU/efJcHoxq8GCp0eB9Bplm1UaHOGoVMcTDD7ww7QVpWhrk206tg/TKxhJ4F1cnF6N/fJx5CR5itQ1yxlBia/X+f2OfDHPwEXYLulKTTtgI9wY+0dFokg8K72ZgRL8n6jJODMMLvhht1c+Yl4g7Cqpx/pdAAAAFQCbtr3MaRtR5rN3eELRWaC+7ArZvwAAAIAgmnlHWqAKQzCvyGehUb03NovjyPThAp6ZP3zA5hconScV7/R36s5XdLvz7GUnGCVwqh+mRp5JH00Qz6rqVzgTxeG5Ju2OOfD/RE3kFKVYkjhDZJyAisyDeEHmW12Rs8GqJmQknmEN+QoQieUdlEN7X3mRhHjhZ5NGGej7Qic1agAAAIAKiG6I6ZI/2CwbSxwjswAm6/uLcmdNq/HPzRzU4Md9OmZoyj0jlfIxDQhauXXEhkjer1cWmrbotwGY+7Y8vP6o00RiZibVScNxqho1jHr4oR8k1OY9lj4OGbcTEeTK4saptGVGPSzZC0aPv3CMYgFl7UcNu+MFLiusgjqJU/MR/g== lieo@lieotekiMacBook-Pro.local
ssh-dss AAAAB3NzaC1kc3MAAACBAMolU/XDWLUfrG+d0MXZlEcGdN/1r9adKFWnSJWguCbgeeWRheF79tpJf/mqNTRYUaHzXuYY8TzriRQCT40wcCzt0Au2cmETKhFYczK3nYyscLJCuDt5zcGT+9xort9Bd9rGZZBbyhblw2DqBysooUPqxgJA+GNqsozjflFo1eJJAAAAFQD3wEO0ay6XGaPDs0ErXVf7hefpswAAAIBRbVzPf2vFSt+yD5fqsSCnji+Vz4mDcx+Z+jbc1h2/Liv+nVy2CRq7JrPX2qrY/3kodPPaGgb441VbDVXsfLnUiRGoOT1rIUz/G3QsmDN9pBqyAMlgfemDpzEtMZ0wdM7CQoBjiPP53TP3YhPF+LRfKtEr85h34zkR8suAeexzVgAAAIBSIdmMzn+uZwPdld9ADWS6BXtvDc7+BdUwAycESJWWZVevUvD2pVE3XyaXPhRHlIHCBCWAo9n2gljeIRtp/uj97ALrIw4nJ49PTZHUefDSzeBAxfp6YFCsp2J3jA+dgBxgVNSPEMQt7IR5QWQu6GHW4S18qYOExLrhcY8kWy24LQ== zhaow@server250
ssh-dss AAAAB3NzaC1kc3MAAACBAO8avAQlQANUws9NrFC21agKOnbRRYPBCBpsmrDWsrDS7YSV1nqZL84SRS2RE3onZ/0KjfFbn4Alcv7nAeCFQexC2oJbiaDnokfstNsxiFMA6S33YGOriVTOjgQV1UOvXEGoaoMij39/JFRImky5at5rIxVzYE1fBlaeympKVKhlAAAAFQDnsCcscumuWwV7SsrMFnkknQzAQwAAAIApWs4K03FuYlBC9XzrhuKoSG7kcglVoZBT7NGwMhp4upJAypYdTkOi3GIA22Ou3pJZCOenvWrk2txIj6tD25fH1PJb3P8BWajJRSPBQHMiT1J5fnhXTseQWm7ngtDPW1wfHeZf6RP+L2D3C1r681tks0LPYSU74b4HphZz/9Yu7QAAAIEAl1Y2CSqAbx4fuAuMgjSsJ5kA+XdYZzDbrA6AF918omR0XZ70Fb8rtsElBHAQwRF7ucs+BB5vBCRfeWxPLfVwOgXEKpI+sUVtkg+OVkvGiQn69w9C36/woeJtaWaesn1TgASm2z5fy7hl5mTFrYE4/pm6bhoDD7GfnndjjDf979k= niuwp@server250
end



useradd -g 100 kingnet

sed -i  's/^SELINUX=.*/SELINUX=disabled/g'  /etc/selinux/config
if  fdisk  -l |grep '/dev/vdb'; then
if [ ! -d  "/data/gaoda" ] && [  ! -d  "/opt/app" ];then
mkfs.ext3 /dev/vdb;
mount /dev/vdb /data;
mkdir -p /data/app
mkdir -p /data/gaoda/version
ln -s /data/app /opt/app
chown -R kingnet.users /data/
chown -R kingnet.users /opt

cat >>/etc/fstab <<end
/dev/vdb          /data          ext3      noatime,defaults 0 0
end
fi
fi
cat >>/etc/sudoers<<end
%users      ALL=(ALL)      NOPASSWD: ALL
%users      ALL=(root)          NSU
end

cat >> /etc/sysctl.conf << end
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_keepalive_time = 300
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 0
net.ipv4.tcp_timestamps = 0
net.ipv4.ip_local_port_range = 4096 65000
net.ipv4.icmp_echo_ignore_all = 0
net.ipv4.tcp_ecn = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_max_tw_buckets = 10240

net.core.wmem_max = 8388608
net.core.rmem_max = 8388608
net.ipv4.tcp_rmem = 4096 87380 8388608
net.ipv4.tcp_wmem = 4096 87380 8388608
kernel.shmmax = 2147483648
kernel.core_pattern = /data/core_file/core_%e_%t
net.ipv4.ip_local_reserved_ports = 18101-18399,19000-19200
end
mkdir /data/core_file
sysctl -p

cat >> /etc/security/limits.conf << end
@users               soft     nofile          100001
@users               hard     nofile          100002
kingnet              soft     nofile          100001
kingnet              hard     nofile          100002
end
cat >> /etc/profile << end
HISTFILESIZE=2000
HISTSIZE=2000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export HISTTIMEFORMAT HISTSIZE HISTFILESIZE
ulimit -HSn 81920
ulimit -S -c unlimited
end
source /etc/profile

if  grep 6\..* /etc/redhat-release ;then
yum groupinstall "Development Tools" -y && \
yum -y update && \
yum -y install kmod-xfs xfsdump xfsprogs xfsprogs-devel openssl-devel \
libtermcap libtermcap-devel libidn-devel krb5-devel ncurses-devel ncurses \
libxml2-devel curl-devel gmp-devel ntp sysstat pcre pcre-devel net-snmp  \
libxml2-devel.i386 lrzsz openssl-devel dstat perl-libwww-perl openssl-devel libmcrypt libmcrypt-devel \
compat-libstdc++-296 bzip2 bzip2-devel libjpeg-devel libjpeg python-devel libtermcap-devel ncurses-devel readline-devel \
freetype-devel libXpm-devel t1lib-devel mhash-devel.x86_64 gettext.x86_64 gettext-devel.x86_64 xmlto.x86_64 libmcrypt-devel.x86_64 libmcrypt.x86_64 puppet \
openssl-devel.i386 libtermcap-devel.i386 libidn-devel.i386 krb5-devel.i386 \
ncurses-devel.i386 curl-devel.i386 gmp-devel.i386 pcre-devel.i386 libxml2-devel.i386 \
perl-libwww-perl compat-libstdc++-296.i386 bzip2 bzip2-devel.i386 libjpeg-devel.i386 \
python-devel.i386 freetype-devel.i386 libXpm-devel.i386 libpng-devel.i386 mhash-devel.i386 libmcrypt-devel.i386 libmcrypt.i386 \
gettext.i386 gettext-devel.i386 libtool-ltdl* gcc texinfo-tex flex zip libgcc.i686 glibc-devel.i686 libtool-ltdl*  libstdc++* glibc-static libstdc++-static libevent-devel gcc-c++ cmake bison-devel ncurses-devel libaio \
libtool-ltdl*  libstdc++* glibc-static libstdc++-static  gflags-devel glog-devel lmdb-devel boost-devel ImageMagick libevent-devel libuv libpng12

/etc/init.d/iptables stop
fi

if  grep 7\..* /etc/redhat-release ;then
yum -y update && \
yum -y install kmod-xfs xfsdump xfsprogs xfsprogs-devel openssl-devel \
libtermcap libtermcap-devel libidn-devel krb5-devel ncurses-devel ncurses \
libxml2-devel curl-devel gmp-devel ntp sysstat pcre pcre-devel net-snmp  \
libxml2-devel.i386 lrzsz openssl-devel dstat perl-libwww-perl openssl-devel libmcrypt libmcrypt-devel \
compat-libstdc++-296 bzip2 bzip2-devel libjpeg-devel libjpeg python-devel libtermcap-devel ncurses-devel readline-devel \
freetype-devel libXpm-devel t1lib-devel mhash-devel.x86_64 gettext.x86_64 gettext-devel.x86_64 xmlto.x86_64 libmcrypt-devel.x86_64 libmcrypt.x86_64 puppet \
openssl-devel.i386 libtermcap-devel.i386 libidn-devel.i386 krb5-devel.i386 \
ncurses-devel.i386 curl-devel.i386 gmp-devel.i386 pcre-devel.i386 libxml2-devel.i386 \
perl-libwww-perl compat-libstdc++-296.i386 bzip2 bzip2-devel.i386 libjpeg-devel.i386 \
python-devel.i386 freetype-devel.i386 libXpm-devel.i386 libpng-devel.i386 mhash-devel.i386 libmcrypt-devel.i386 libmcrypt.i386 \
gettext.i386 gettext-devel.i386 libtool-ltdl* gcc texinfo-tex flex zip libgcc.i686 glibc-devel.i686 libtool-ltdl*  libstdc++* glibc-static libstdc++-static libevent-devel gcc-c++ cmake bison-devel ncurses-devel libaio \
libtool-ltdl*  libstdc++* glibc-static libstdc++-static  gflags-devel glog-devel lmdb-devel boost-devel ImageMagick libevent-devel libuv libpng12

systemd-analyze set-log-level notice
systemctl stop firewalld.service
systemctl disable firewalld.service
fi



###### 作业平台中执行脚本成功和失败的标准只取决于脚本最后一条执行语句的返回值
###### 如果返回值为0，则认为此脚本执行成功，如果非0，则认为脚本执行失败
