## 一加3T三段式开关切换 openpilot 版本

通过SSH登录到EON中，把 openpilot 不同版本的代码克隆到 `/data/forks` 目录下，然后根据自己的需求修改 `PATH_FORK_{N}` 的路径即可。

修改文件存储目录：第 4 行

修改不同版本OP目录：5 ~ 7 行（分别对应三段开关）

```bash
#!/usr/bin/env bash

# 配置每个 fork 目录位置
PATH_FORK=/data/forks
PATH_FORK_1=${PATH_FORK}/gernby
PATH_FORK_2=${PATH_FORK}/openpilot
PATH_FORK_3=${PATH_FORK}/dragonpilot

switch=`cat /sys/devices/virtual/switch/tri-state-key/state`
VAR_OP_PATH=`eval echo "$""PATH_FORK_${switch}"`
OP_PATH=${VAR_OP_PATH}

ENV_OP_PATH=/data/openpilot
# 处理旧版本
if [ ! -L "${ENV_OP_PATH}" ]; then
    ms=`date +%s_%N`
    mv "${ENV_OP_PATH}" "${PATH_FORK}/backup_${ms}"
fi
# 处理软链
rm -f ${ENV_OP_PATH}
ln -sf ${OP_PATH} ${ENV_OP_PATH}

# 启动 openpilot
cd ${ENV_OP_PATH}
exec ./launch_openpilot.sh
```

脚本下载：[https://gist.github.com/Rming/c8af432cede79a18a5eee1048b95d7bb](https://gist.github.com/Rming/c8af432cede79a18a5eee1048b95d7bb)
