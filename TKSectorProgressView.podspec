Pod::Spec.new do |s|
  s.name         = "TKSectorProgressView" #* 要和文件名一样
  s.version      = "1.0.1" #* 版本号
  s.summary      = "An simple animation sector progress view" # 简介
  s.homepage     = "https://github.com/TBXark/TKSectorProgressView" # 主页
  s.license      = { :type => 'MIT License', :file => 'LICENSE' } # 协议
  s.author       = { "USER_NAME" => "E-MAIL" } # 作者
  s.source       = { :git => "https://github.com/TBXark/TKSectorProgressView.git", :tag => s.version } #* github源
  s.platform     = :ios, '8.0' # 平台,系统版本
  s.source_files = 'TKSectorProgressView/TKSectorProgressView.swift' # 源代码文件,及路径
  s.requires_arc = true # ARC 支持
end
