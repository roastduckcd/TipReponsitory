TAGS: 工具使用

# Git 命令行的使用

创建SSH连接git
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

问题
https://stackoverflow.com/questions/42685633/ssh-vt-gitgithub-com-get-no-such-file-or-directory-error#comment72500698_42687786


所有的版本控制系统，只能跟踪文本文件的改动。媒体文件内容不能追踪，只能追踪媒体文件属性，如大小、时间等。
git config --list
https://git-scm.com/book/zh/v1/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE

1. 如果是新文件要往GitHub上`push`
	* 进入要上传文件根目录，执行`git init`
	* `git add`新文件
	* `git commit -m 提交描述`提交变化

2. 检查

	* `git status` 是否有文件未提交
	
	
	