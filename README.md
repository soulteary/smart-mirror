# Smart Mirror

![I'm a Mirror!](./assets/mirror.png)

搭建私有镜像，确保开发和发布环境的依赖稳定，推荐中国地区用户使用，大幅节约网络传输时间。[ENGLISH VERSION](./doc/readme-en.md)

# 快速开始

- [独立服务器使用](./docs/standalone-server.md) `适合给公司/团队/个人使用`
- [本地虚拟机使用](./docs/local-virtual-machine.md) `适合个人本地开发使用`

# 支持命令

## 导入GPG Key

如果你期望使用GPG Key来校验你的签名文件，你需要先导入这些Key。

___如果你只要简单的校验，可以跳过这个步骤。___

```bash
bash ./smart-mirror import-gpg-keys
```

## 创建Node.js/IO.js发布版本镜像

### 基础使用

创建远程网站完整的镜像。

```
bash ./smart-mirror create-mirror node
bash ./smart-mirror create-mirror io
```

### 进阶使用

同步指定版本。

- 默认同步所有版本，指定任意版本过滤参数后失效。

    ```
    bash ./smart-mirror create-mirror node --all-dist
    ```

- 仅同步最新的v5.x的Node.js。

    ```
    bash ./smart-mirror create-mirror node --without-gt-5.x
    ```

- 不同步0.11和0.12版本的Node.js。

    ```
    bash ./smart-mirror create-mirror node --without-0.12 --without-0.11
    ```

- 同步除了远古的0.x.x版本外的Node.js。

    ```
    bash ./smart-mirror create-mirror node --without-0.x
    ```

- 不使用SSL进行下载。

    ```
    bash ./smart-mirror create-mirror node --without-ssl
    ```



### 支持的版本过滤参数

```
# sync all dist
--all-dist

# sync without 0.x.x version
--without-0.x

# sync without 0.12.x version
--without-0.12

# sync without 0.11.x version
--without-0.11

# sync without 0.10 version
--without-0.10

# sync without 4.x version
--without-4.x

# sync without 5.x version
--without-5.x


# sync without version < 0.12.10
--without-gt-0.12.10

# sync without version < 0.11
--without-gt-0.11

# sync without version < 0.10.40
--without-gt-0.10.40

# sync without version < 0.10
--without-gt-0.10

# sync without version < 4.x
--without-gt-4.x

# sync without version < 5.x
--without-gt-5.x

```