---
title: git-ssh设置
categories:
  - 笔记
tag:
  - git
date: 2018-11-21 21:08:18
---


​	  Windows环境 在使用多个 `git` 账号的时候，默认只能配置 1 个 git 账号，这就导致在使用其他账号进行 git 操作时每次都需要输入用户名和密码，本文记录了在 win7 配置多个 ssh-key 来管理 git 账号的过程，以下以配置 github 账号 为例。



<!-- more -->



1. 打开 git bash， 输入  ` ssh-keygen -t rsa -C <email>`  生成 SSH Key；

   ```
   ssh-keygen -t rsa -C 468905342@qq.com
   ```

2. 输入文件名称保存 key，例：id_rsa_github；

3. 输入密码并确认密码，此处建议直接回车（不设置密码），如果设置了密码，在以后的 git 的操作中还是需要输入密码才能继续操作。另外，在这里输入密码是没有任何显示和提示的，wtf ?!，我第一次操作的时候输入了密码，结果没有任何反应，我还以为是程序出错了。脑补你输入的密码，按 `Enter` 键二次输入确认密码，设置成功。以后你在 git 操作的时候输入密码时也是没有提示的。

   ![git-ssh-01](https://mr-welson.github.io/assets/images/git-ssh-01.png)

4. 上述操作成功后会在你打开 git bash 的目录生成2个文件（id_rsa_github 和 id_rsa_github.pub），拷贝这2个文件到 git .ssh 的默认目录，Windows在 ` C:\Users\Administrator\.ssh` ，**config **文件是在下一步手动创建的，**known_hosts**文件是后续自动生成的，如下图：

   ![git-ssh-02](https://mr-welson.github.io/assets/images/git-ssh-02.png)

5. 在 .ssh 目录下创建一个 config 文本文件，添加相关配置；

    每个账号单独配置一个 **Host**，**Host** 要取一个别名（aliasName），别名在检测配置时需要用到，其他主要配置 **HostName** 和 **IdentityFile** 两个属性即可。

    **config文件配置如下：**	

    ```
    # 配置 github.com
    Host github.com                 
        HostName github.com
        IdentityFile C:\Users\Administrator\.ssh\\id_rsa_github
        PreferredAuthentications publickey
        User 468905342@qq.com
        
    # 配置 Host
    Host   <aliasName>
    	HostName                 	真实的域名地址
    	IdentityFile            	id_rsa的存放地址 
    	PreferredAuthentications 	配置登录时用什么权限认证：publickey， 
    									password publickey， keyboardinteractive
    	User                     	配置使用用户名
    ```

6. 检测配置，输入 ` ssh -T git@<aliasName>` ，以下图示命令行的 github.com 即为上一步config配置文件中设置的Host的别名：

   ![git-ssh-03](https://mr-welson.github.io/assets/images/git-ssh-03.png)

7. 配置成功后，需要到你的 github 配置 SSH。

8. 打开 [github](https://github.com/) 官网并登录，右上角点击你的图标，选择 Settings -> 选择 SSH and GPG keys -> 点击 New SSH key，复制上述生成文件 id_rsa_github.pub 的内容，粘贴到 `Key` 一栏中，`Title` 一栏可以随意填写：

   ![git-ssh-06](https://mr-welson.github.io/assets/images/git-ssh-06.png)

9. 上述操作完成后，回到你的 github 本地仓库，此时进行 push 操作提示需要输入密码，因为还没有将远程仓库地址改为 ssh 地址。

10. 在  [github](https://github.com/)  仓库中复制仓库的 ssh 地址：

  ![git-ssh-04](https://mr-welson.github.io/assets/images/git-ssh-04.png)

11. 修改远程仓库地址

    输入 ` git remote set-url origin <ssh_url>`

    ![git-ssh-05](https://mr-welson.github.io/assets/images/git-ssh-05.png)

12. 此时在进行 `git push` 操作就不需要输入密码了。



以后再拉 github 仓库的时候选择 Clone with SSH（第10步），`push` 的时候就免去输入密码的烦恼啦。



