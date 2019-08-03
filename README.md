# 橙果 Github Page 源码

橙果 Github Page 静态资源源码仓库。

# 依赖

依赖的仓库：
+ [HangZhouShuChengKeJi.github.io](https://github.com/HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git) 组织机构的站点文件（html等），即 jekyll 生成的静态站点文件。
+ [site](https://github.com/HangZhouShuChengKeJi/site.git) 组织机构站点文件的源文件（原始 markdown 文件）


依赖的软件：
+ [ruby](http://www.ruby-lang.org)
+ [jekyll](https://jekyllrb.com)

主题样式：
+ [jekyll-TeXt-theme](https://github.com/kitian616/jekyll-TeXt-theme) 工程里已经包含样式文件，不需要额外安装。


# 准备工作
准备一个干净的目录，分别拉取 [HangZhouShuChengKeJi.github.io](https://github.com/HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git) 和  [site](https://github.com/HangZhouShuChengKeJi/site.git) 两个仓库。

操作步骤如下（在适当的目录下执行以下命令）：
```sh
# 创建目录，用于放置 Github Page 相关的代码
mkdir GithubPage

cd GithubPage

# 拉取工程 HangZhouShuChengKeJi.github.io
git clone git@github.com:HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git

# 拉取工程 site
git clone git@github.com:HangZhouShuChengKeJi/site.git
```

最终目录结构如下：
```txt
root/
    GithubPage/
        HangZhouShuChengKeJi.github.io/
        site/
```

> `HangZhouShuChengKeJi.github.io` 和 `site` 两个目录名称不能修改

# 写作 & 预览
写作 和 预览都在 `site` 目录下进行。

写作完成后，执行 `bundle exec jekyll serve` 命令，开启 jekyll 服务器，默认监听 `4000` 端口。启动成功后，在浏览器中访问 `http://127.0.0.1:4000` 即可预览写作结果。

## 目录结构说明
这里指 `site` 工程的目录结构：
```txt
site/
    _data/          # jekyll 的数据文件
    _doc/           # doc 集合（该集合是我们自己设定的，一般请勿改动）的文档目录。我们主要在该目录下写作
    _includes/      # jekyll 生成静态文件时，使用的一些组件文件（类似于 jsp 文件）
    _layouts/       # jekyll 生成静态文件时，使用的一些布局文件（类似于 jsp 模板页）
    _posts/         # jekyll 自带文件，jekyll 指定的默认写作路径。该路径下的文件名必须满足格式：yyyy-MM-dd-<title>.md 的格式
    _sass/          # jekyll 自带目录，放置 sass 源码文件（样式文件）
    _site/          # jekyll 默认输出目录，执行 jekyll 构建命令后，会出现该目录
    .sass-cache/    # jekyll 构建过程中，sass 构建结果的缓存目录
    assets/         # jekyll 自带目录，放置静态资源文件（js、css、图片等静态资源）
    img/            # 图片目录，用于存放（我们自己设定的）
    _config.yml     # jekyll 配置文件
    .gitignore      # git 忽略规则文件
    404.md          # "404" 页面的 markdown 源码
    about.md        # "关于" 页面的 markdown 源码
    archive.md      # "归档" 页面的 markdown 源码
    CNAME           # cname 文件，用于指定域名
    deploy.rb       # 部署脚本
    Gemfile         # gem 配置文件
    Gemfile.lock    # gem 相关文件
    index.md        # "index" 页面的 markdown 源码
    LICENSE         # 版权信息文件（一般请勿修改）
    README.md       # readme 文件
```

> `_doc` 目录一般放置一些固定链接的文章，例如：帮助、隐私说明、公司介绍之类的
> `_posts` 目录一般放置我们日常写的博客文章等，可以按照日期归档


# 部署

运行部署脚本（`deploy.rb`），进行构建和部署：
```sh
ruby deploy.rb
```

> **部署脚本工作原理：**
> 
> + 执行 jekyll 构建命令： `bundle exec jekyll build`
> + jekyll 生成的静态文件输出到 `_site` 目录下
> + 清空部署目录： `GithubPage/HangZhouShuChengKeJi.github.io`
> + 将 `GithubPage/site/_site` 目录下的所有内容复制到部署目录
> + 进入 `GithubPage/HangZhouShuChengKeJi.github.io` 目录，执行 `git commit` 和 `git push` 操作


# 附录
## jekyll 常用命令
```sh
# 构建静态站点
bundle exec jekyll build

# 构建并启动 jekyll 服务
bundle exec jekyll serve

# 清理构建结果
bundle exec jekyll clean
```

## 注意事项
+ 必须提前配置好 git 的 ssh 密钥。因为部署脚本（deploy.rb）中，使用 ssh 方式提交代码

## 参考
+ [ruby](http://www.ruby-lang.org)
+ [jekyll 官网](https://jekyllrb.com/)
+ [jekyll-TeXt-theme 源码](https://github.com/kitian616/jekyll-TeXt-theme)
+ [jekyll-TeXt-theme 使用文档（中文）](https://tianqi.name/jekyll-TeXt-theme/docs/zh/quick-start)
