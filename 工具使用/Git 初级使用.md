TAGS: 工具使用

# Git 初级使用

[TOC]
___
## 一点点重要的Tip
　　所有的版本控制系统，只能跟踪文本文件的改动。媒体文件内容不能追踪，只能追踪媒体文件属性，如大小、时间等。
## 创建SSH连接Github
1. 网上很多教程，但是有可能不完整，所以最好还是对照[Github官网](https://help.github.com/articles/connecting-to-github-with-ssh/)上的教程。

2. 创建时遇到的问题
问题1：[参考链接](https://stackoverflow.com/questions/42685633/ssh-vt-gitgithub-com-get-no-such-file-or-directory-error#comment72500698_42687786)
```
The authenticity of host 'github.com (192.30.253.113)' can't be established.RSA key fingerprint is　SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
```
　　啥？操作半天你说不能建立···一步步来的，哪儿错老嘛！！！于是`no`。殊不知这里不用管，直接`yes`就到下一步，然后就等着成功就对了。!_!
　　
## 前期配置Git
[参考链接](https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)
####1. 查看配置
`git config --list`：列出当前配置项
重点关注`name`和`email`。
####2. 修改配置
```
git config --global user.name Github用户名
git config --global user.email Github注册邮箱
```

## 使用
　　在`Github`新建一个代码仓`MyReponsitory`。记得选取`.gitignore`
####1. 直接使用服务器代码仓

　　`git clone  git@github.com:Github用户名/MyReponsitory.git`

####2. 本地创建代码仓，再`push`到Github

* `cd` 到根目录
* `git init` 初始化本地目录为代码仓。
* `git add . 或具体文件名.` git开始追踪本地文件。
* `git status` 查看是否还有未提交的修改
* `git commit -m 描述` 提交此次修改
* `git remote add origin git@github.com:用户名/MyReponsitory.git` 把本地仓与Github远程仓库关联
*  `git pull origin master --allow-unrelated-histories`将服务器数据先拉取到本地。
* `git push -u origin master` 将本地更改推送到远程服务器。
    最好还是先从服务器clone一个版本仓下来，然后往里面加东西，直接`add`后`commit`就行了。
<br/>
####3. 修改了文件内容
`git status`: 查看文件状态
　　staged：文件被暂存(commit了)
　　modified, unstaged：文件被修改了但是没有被暂存
　　untracked：文件没有被跟踪
　　`commit`或`push`前检查一下，总是个好习惯。
　　
`git pull`: 从服务器拉取最新的版本。`push`前总是保持本地仓和服务器一致，本地仓出问题好过服务器版本出问题，毕竟解决本地仓的冲突要容易的多。

`git commit`: 提交最新修改内容，尽量简洁概括并包含你所有修改部分。

`git push`: 记住一定要先`pull`,上一步`commit`时没做，此时也一定要做。
<br/>
####4. 添加`.gitignore`
`vi .gitignore`或者用文本编辑器打开(前提是要[显示隐藏文件](http://www.jianshu.com/p/da2f6721491d))。在文件最后添加
```
# mac系统下用于存储当前文件夹的一些Meta信息，不需要。
*.DS_Store 
# 忽略pods项目中的xcworkspace, 使用了CocoaPods，只需要上传Podfile即可。
*.xcuserstate
*.xcworkspace
xcuserdata/
UserInterfaceState.xcuserstate
*.xcworkspace/
xcuserdata/
UserInterface.xcuserstate 
# 忽略Pods
Pods/
```
　　但是有时可能遇到`.gitignore`失效的情况，这种多半是因为已经`commit`了。对已经添加版本控制的文件再加入`.gitignore`是无效的，此时需要删除下缓存。
```
// 删除前总是先看一下清单，免得误删
git rm -n –cached 需要忽略的文件(夹)
// 执行删除
git rm -r –cached 需要忽略的文件(夹)
// 告知服务器
git commit -m 删除xx以移除版本控制
git push
```
　　这种方式也可以用来将指定文件(夹)移除版本控制。
　　要移除本地文件版本控制？`sudo rm -R .git`即可
**注意： .gitignore只能忽略那些原来没有被track的文件。**
<br/>
####6. 遇到的问题

* Github中文件夹不能进入，不可用。使用`git　status`看到子目录状态是`ｕｎtrackｅｄ`。可能因为子目录也含有`.git`,删除后回根目录重新`init`一次
<br/>
* `fatal: refusing to merge unrelated histories`
"git merge" used to allow merging two branches that have no common base by default, which led to a brand new history of an existing project created and then get pulled by an unsuspecting maintainer, which allowed an unnecessary parallel history merged into the existing project. The command has been taught not to allow this by default
　　`git pull origin master --allow-unrelated-histories`
<br/>
* `Please make sure you have the correct access rights and the repository exists.`
　　问题已经提示很明显了，可能是ssh密钥匹配不上，或者是仓库名出错。

　　前者：执行`ssh -v -t git@github.com`检查连接，匹配不上说明需要重新上传rsa_pub,详情戳[Github官网](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

　　后者：就需要检查你的remote连接了。我就是仓库地址出错。可以在终端重新`git remote add origin 仓库地址`或者`vi .git/config`，然后修改里面的url。url最好从Github上区复制。


