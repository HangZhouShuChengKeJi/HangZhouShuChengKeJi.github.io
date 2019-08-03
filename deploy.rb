#!/usr/bin/ruby

require 'pathname'
require "fileutils" 
 
 
BEGIN {
    puts ">>>> 开始构建 "
}

# 1. 打印信息

# 工作目录
workDir = Pathname.new(Pathname.new(__FILE__).parent).realpath
# 构建输出路径
buildOutputDir = workDir + "_site"
# 部署目录
deployDir = Pathname.new(workDir.parent + "HangZhouShuChengKeJi.github.io").realpath

puts "  >> 工作目录 : #{workDir}"
puts "  >> 输出目录 : #{buildOutputDir}"
puts "  >> 部署目录 : #{deployDir}"

puts "\n\n"


# 2. 生成静态文件

puts ">>>> 生成静态文件 （执行命令 : bundle exec jekyll build）"

system 'bundle exec jekyll build'

puts "\n\n"


# 3. 清空部署目录

puts ">>>> 清空部署目录 : #{deployDir}"

Dir.foreach(deployDir) {|item| 
    if item == "." ||  item == ".." || item == ".git" || item == "_config.yml"
        puts "  >> 跳过 : #{item}"
    else
        # 获取完整路径
        item = Pathname.new(deployDir + item).realpath
        if File.file?(item)
            puts "  >> 删除文件 : #{item}"
            FileUtils.rm(item)
        elsif File.directory?(item)
            puts "  >> 删除目录 : #{item}"
            FileUtils.rm_rf(item)
        else
            puts "  >> 未知类型的文件 : #{item}"
        end
    end
}

puts "\n\n"


# 4. 复制构建结果

puts ">>>> 复制构建结果 : #{buildOutputDir}"

Dir.foreach(buildOutputDir) {|item| 
    if item == "." ||  item == ".." || item == ".git" || item == "_config.yml"
        puts "  >> 跳过 : #{item}"
    else
        # 获取完整路径
        srcRealpath = Pathname.new(buildOutputDir + item).realpath
        destRealpath = Pathname.new(deployDir + item)

        if File.file?(srcRealpath)
            puts "  >> 复制文件 : #{srcRealpath} \t-> #{destRealpath}"
            FileUtils.cp(srcRealpath, deployDir)
        elsif File.directory?(srcRealpath)
            puts "  >> 复制目录 : #{srcRealpath} \t-> #{destRealpath}"
            FileUtils.cp_r(srcRealpath, deployDir)
        else
            puts "  >> 未知类型的文件 : #{srcRealpath}"
        end
    end
}

puts "\n\n"


# 5. 上传静态文件到 Github

puts ">>>> 上传静态文件到 Github"

puts "  >> 切换到部署目录 : #{deployDir}"
Dir.chdir(deployDir)

# 提交信息
commitMsg = "更新站点文件"

puts "  >> 执行 git commit 操作"
system 'git add .'
system ('git commit -m "重新生成站点文件"' % [commitMsg])

puts "  >> 执行 git push 操作"
system 'git push -u origin master'

puts "  >> 切换到工作目录 : #{workDir}"
Dir.chdir(workDir)

puts "\n\n"


END {
    puts ">>>> 构建结束 "
    puts "\n\n"
}
