# 输出 hello seekplum

## 概述

本项目参考[自制 os 极简教程 2：史上最难的 hello world](https://mp.weixin.qq.com/s/8Tze-2FWSRdLV1A80_Oppg)文章进行操作。

## 启动 OS

```bash
# 1.选择「Begin simulation」输入「6」 2.启动后输入 「c」
bash -xe ./start.sh
```

## 查看编译后内容

```bash
vi -b boot.bin

# 转成16进制
%!xxd

# 恢复16进制
%!xxd -r
```

## 参考

- 1.[mac 下 bochs 环境搭建运行“helloworld 操作系统”](https://blog.csdn.net/devenlau/article/details/60876561)
