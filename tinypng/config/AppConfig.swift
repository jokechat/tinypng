// Config.swift
// tinypng
//
// Created by jokechat  on 2018/1/4.
//Copyright © 2018年 jokechat. All rights reserved.
// app 配置

import Foundation

class AppConfig
{
	// 域名配置
	static let DOMAIN = "http://api.jokechat.cn"
	
	// log 配置信息
	static let LOG_APPID = "1"
	static let LOG_APPSECRET = "1"
	// 加密key encryptionKey
	static let LOG_ENCRYPTIONKEY = "qgQbrA4psxzgManlfe0cf1jxry9p2c07"
	
	// log 文件路径
	static let LOG_FILEPATH = "/Users/jokechat/develop/log/tinypng.log"

	// 服务器log 配置
	static let LOG_SERVER_URL = "http://api.jokechat.cn/api/index/hello"
}
