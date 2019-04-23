

Pod::Spec.new do |s|

  # 库名字
  s.name         = "LFBPageController"
  # 库的版本
  s.version      = "1.0.0"
  # 库摘要
  s.summary      = "一款仿网易标题滚动切换页面的框架"
  # 库描述
  s.description  = <<-DESC
                   简单易容的标题滚动切换页面框架，通过点击标题或者滑动页面，切换页面和标题...
                  DESC

  # 远程仓库地址,即GitHub地址，或者你使用的其他Gitlab地址
  s.homepage     = "https://github.com/LiuFuBo1991/LFBPageController"
  
  # MIT许可证 (The MIT License),软件授权条款
  s.license      = "MIT"


  # 作者信息
  s.author             = { "liufubo" => "18380438251@163.com" }
  # 作者信息
  s.social_media_url   = "http://www.jianshu.com/u/7d935e492eec"
   

  # 支持的系统及支持的最低系统版本
  s.platform     = :ios
  s.platform     = :ios, "8.0"

  #  支持多平台使用时配置
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # 下载地址，远程仓库的 GitHub下载地址(clone 地址), 使用.git结尾
  #  如果使用版本号做为tag那么不能频繁的打tag，必须要保持版本号和tag一致，否在拉取到的将是版本号作为tag对应提交的内容
  s.source       = { :git => "https://github.com/LiuFuBo1991/LFBPageController.git", :tag => "#{s.version}" }


  # 库文件在仓库中的相对路径
  # 等号后面的第一个参数表示的是要添加 Cocoapods 依赖的库在项目中的相对路径
  # 我的库在库根目录，所以直接就是LFBPageController
  # 如果库放在其他地方，比如LFBPage/LFBPageController,则填写实际相对路径
  # 等号后的第二个参数，表示LFBPageController文件夹下的哪些文件需要 Cocoapods依赖
  # "**"这个通配符代表LFBPageController文件下所有文件,"*.{h,m}代表所有的.h,.m文件"
  s.source_files  = "LFBPageController", "LFBPageController/**/*.{h,m,md}"
  # 指明 LFBSocialSDK文件夹下不需要添加到 Cocoapods的文件
  # 这里 Exclude 文件夹内的内容
  #s.exclude_files = "LFBPageController/Exclude"
  # 公开头文件 
  #s.public_header_files = "LFBPageController/Classes/**/*.h"

  # 项目中是否用到ARC
  s.requires_arc = true

  # 项目中的图片资源
  #s.resource_bundles = {
   # 'LFBPageController' => ['LFBPageController/**/*.{xcassets}']
  #}
  
  

  
  # 库中用到的框架或系统库 (没有用到可以没有)
  #s.static_framework = true
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

    
  # 如果库中依赖其他的三方库，可以添加这些依赖库


end