# Smart Mirror

![I'm a Mirror!](./assets/mirror.png)

Build private mirrors, ensure the stability of development and publishing environment's dependence.

# How To Use

- [独立服务器使用](./docs/personal-vps.md) `适合给公司/团队/个人使用`
- [本地虚拟机使用](#) `适合个人本地开发使用`

# Support CMD

## Import GPG Keys

    导入GPG Key

If you want to verify your checksum file with GPG Keys,

You need import GPG keys first. (*optional)

    如果你期望使用GPG Key来校验你的签名文件，你需要先导入这些Key。

    如果你只要简单的校验，可以跳过这个步骤。

```bash
bash ./smart-mirror import-gpg-keys
```

## Create Node.js/IO.js Mirror

    创建Node Dist镜像

### Basic Usage

    基础使用

Just create full mirror like orgin dist website.

    创建完整的dist镜像站点。

```
bash ./smart-mirror create-mirror node
bash ./smart-mirror create-mirror io
```

### Advanced Usage

    进阶使用

Sync specify node version(s).

    同步指定版本。


Default sync all dist.

    默认同步所有版本。

```
bash ./smart-mirror create-mirror node --all-dist
```

### Full Version Filter Parameter List

    过滤参数列表


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