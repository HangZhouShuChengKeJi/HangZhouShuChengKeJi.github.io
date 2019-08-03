# 橙果 Github Page 源码

橙果 Github Page 静态资源源码仓库。

# 依赖

依赖的仓库：
+ [HangZhouShuChengKeJi.github.io](https://github.com/HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git) 组织机构的站点文件（html等），即 jekyll 生成的静态站点文件。
+ [site](https://github.com/HangZhouShuChengKeJi/site.git) 组织机构站点文件的源文件（原始 markdown 文件）


依赖的软件：
+ [ruby](http://www.ruby-lang.org)
+ [jekyll](https://jekyllrb.com)


# 准备工作
准备一个干净的目录，分别拉取 [HangZhouShuChengKeJi.github.io](https://github.com/HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git) 和  [site](https://github.com/HangZhouShuChengKeJi/site.git) 两个仓库。

操作步骤如下（在适当的目录下执行以下命令）：
```sh
# 创建目录，用于放置 Github Page 相关的代码
mkdir GithubPage

cd GithubPage

# 拉取项目 HangZhouShuChengKeJi.github.io
git clone git@github.com:HangZhouShuChengKeJi/HangZhouShuChengKeJi.github.io.git

# 拉取项目 site
git clone git@github.com:HangZhouShuChengKeJi/site.git
```

最终目录结构如下：
```txt
root/
    GithubPage/
        HangZhouShuChengKeJi.github.io/
        site/
```

# 写作 & 预览
写作 和 预览都在 `site` 目录下进行。

写作完成后，执行 `bundle exec jekyll serve` 命令，开启 jekyll 服务器，默认监听 `4000` 端口。启动成功后，在浏览器中访问 `http://127.0.0.1:4000` 即可预览写作结果。

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
