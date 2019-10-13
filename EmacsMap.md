Emacs快捷键映射速查表

;; C-x prefix is for default and global bindings that comes with Emacs.
;; C-c prefix is for users to define.
;; C-<number> like C-1, C-2… is similar to C-u,

Ctrl-u [num]        任何操作的次数

Ctrl-x Ctrl-o       以只读的方式打开文件
Ctrl-x Ctrl-v       当发现打开错了文件的时候，重新打开别的文件
Ctrl-x Ctrl-w       当前buffer另存为新的文件名
Ctrl-x Ctrl-s       保存文件
Ctrl-x Ctrl-q       读写、只读模式直接切换
Ctrl-x Ctrl-c       退出编辑器

Ctrl-a Ctrl-e       移动光标到行首、行尾
Meta-a Meta-e       移动光标到段落的最起始或末尾
Ctrl-p Ctrl-n       向上一行、下一行移动
Ctrl-b Ctrl-f       向前、向后一个字符
Meta-b Meta-f       向前、向后跳动一个word
Ctrl-v              向下滚屏
Meta-v              向上滚屏
Ctrl-l              光标所在行卷到顶部、中部、尾部，调整视角使用
Meta-< Meta->       移动光标到整个buffer的开头或结尾

Ctrl-Meta-a 
Ctrl-Meta-b         在函数的头部、尾部跳转

Ctrl-d              删除一个字符
Meta-d              从光标处开始，删除一个单词
Ctrl-w              从当前字符开始，删除到当行结尾(包含换行符)
Ctrl-k              从当前字符删除(剪切)行到行尾，不包含换行符
Meta-k              删除整个段落
Ctrl-g              强制取消当前的操作，重新开始新的击键
Meta-y              显示所有剪切板历史 helm-show-kill-ring

Meta-c              从光标处开始，首字母大写
Meta-u              从光标处开始，大写整个单词
Meta-l              从光标处开始，小写整个单词


Ctrl-q              开始标记，然后可以移动光标进行块选择了 'set-mark-command 
Ctrl-x Ctrl-x       在标记的收尾来回切换，方便修改
Meta-h              选中整个段落 paragraph
Ctrl-Meta h         标记整个函数
Ctrl-x h            标记整个buffer，全选

Ctrl-,              HeaderChar的快速跳转 'ace-jump-mode
Ctrl-.              使用这个命令可以对Ctrl-,的地址反向跳转
Ctrl-x l            到达某行 'goto-line

Ctrl-w              就是我们的剪切
Ctrl-k              从当前光标的位置开始，删除到行尾(含换行符)
Meta-z (c)          从当前光标开始删除到字符c
Ctrl-y              yank，就是我们的粘贴
Meta-w              复制选择的区域块 'kill-ring-save
Ctrl-o              光标所在行下移一行，然后再原先位置新插入一行
Ctrl-j              类似于回车操作，但是会自动缩进保持格式

Ctrl-s              向后增量搜索 'isearch-forward
Ctrl-r              向前增量搜索 'isearch-backwar
RET                 停止搜索
Meta-%              查找替换操作
    SPC 接收替换 DEL 放弃当前命中，继续下一个
    RET 退出替换 ！执行剩余所有替换

Ctrl-/              undo撤销更改
Ctrl-x u            undo撤销更改，相同
Ctrl-\              redo，撤销之再重做

Meta-x revert-buffer 放弃当前修改，从磁盘重新加载文件内容

============

Ctrl-x Ctrl-c       退出Emacs
Ctrl-x Ctrl-b       列出当前所有打开的buffer列表
Ctrl-x d            打开目录(废弃)，效果如下
Ctrl-x Ctrl-d       Dired打开目录
Ctrl-x Ctrl-j       打开当前buffer文件所对应的Dired目录
Ctrl-x 4 Ctrl-j     在另外一个窗口打开当前buffer文件对应的Dired

Command { }         向左右切换tab
Ctrl-TAB            轮训切换tab
Ctrl-x 0            关闭当前窗口
Ctrl-x 1            关闭所有其他，只保留当前窗口
Ctrl-x 2            垂直切分窗口
Ctrl-x 3            水平切分窗口
Ctrl-x o            多个窗口直接轮训切换

Meta-Left/Right/Up/Down 分屏时候切换当前活动窗口

Ctrl-x k            删除buffer，在minibuffer中提示删除的buffer名字
Ctrl-x m            以root的权限编辑当前文件，或直接 /su::/etc/... 打开文件
/sudo::aliuser@taozj.org:/etc/... 远程编辑文件

============

Ctrl-c k            在要插入的点，打开窗口浏览剪切板历史，return就可以粘贴
Ctrl-c s            逐步替换操作，每一步替换会用y/n来确定
Ctrl-c w            开启空白字符显示模式
Ctrl-c c            复制当前行，然后注释之

============

Meta - .            查找光标所在位置的符号信息(需要GTAGS支持)
Meta - /            尝试进行补全单词操作

Ctrl-c h i          显示所有的函数和变量鼎城 helm-semantic-or-imenu
Ctrl-c h m          man/woman帮助命令，感觉macOS上的返回作用不大
Ctrl-c h o          helm-occur，对于光标所在位置的单词查找所有存在位置
Ctrl-c h Ctrl-,     打开计算器

============

Dired文件管理器命令
p / n 			    上一个、下一个条目
< / >               上一个、下一个文件夹条目
^                   父文件夹
f / o               打开该文件(可更改)，而o会分屏显示
v                   只读的方式打开该文件
+                   在当前目录创建子目录

m / u               标记/取消标记文件或目录，以便稍后操作
t                   反向标记

C                   拷贝文件
R                   重新命名文件
D                   删除文件(到回收站)
d ~ #               标记文件待删除 x执行删除命令

g                   刷新目录，列举最新的文档
s                   切换采用文件名、修改时间排序

============

;; helm 相关内容

Meta - y            展示所有剪切板 helm-show-kill-ring
Ctrl-x b            切换buffer helm-mini
Ctrl-x Ctrl-f       打开文件 helm-find-files
     Ctrl-j      进入一个文件夹
     Ctrl-l      跳到上一个文件夹(父目录)
     Ctrl-c h    会打开历史文件记录
     Ctrl-s      搜索光标所在位置的单词，grep; 此时你还可以动态的数据，然后minibuf动态反馈grep结果

