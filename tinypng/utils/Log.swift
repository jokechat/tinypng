// Log.swift
// tinypng
//
// Created by jokechat  on 2018/1/6.
//Copyright © 2018年 jokechat. All rights reserved.
// 功能描述

import Foundation
import SwiftyBeaver

class Log
{
	public var appID = AppConfig.LOG_APPID
	
	public var appSecret = AppConfig.LOG_APPSECRET
	
	public var encryptionKey = AppConfig.LOG_ENCRYPTIONKEY
	
	
	private var log : SwiftyBeaver.Type?
	private var cloud : SBPlatformDestination?
	
	init(_appID  : String = "" , _appSecret : String = "" ,_encryptionKey : String = "")
	{
		if (_appID != "" && _appSecret != "" && _encryptionKey != "") {
			appID 		= _appID;
			appSecret	= _appSecret
			encryptionKey = _encryptionKey
		}
		// 构造处理 log对象
		log = SwiftyBeaver.self
		
		// 控制台log
		let console = ConsoleDestination()  // log to Xcode Console
		
		// 文件log
		let file = FileDestination()  // log to default swiftybeaver.log file
		file.logFileURL = URL(fileURLWithPath: AppConfig.LOG_FILEPATH)
		
		// 添加云服务器
		let mycloud = SBPlatformDestination(appID: appID, appSecret: appSecret, encryptionKey: encryptionKey) // to cloud
		mycloud.serverURL = URL.init(string: AppConfig.LOG_SERVER_URL)
		
		
		console.format = "$DHH:mm:ss$d $L $M"
		
		// add the destinations to SwiftyBeaver
		log?.addDestination(console)
		log?.addDestination(file)
		log?.addDestination(mycloud)
		cloud = mycloud
	}
	
	// 详细信息
	open func verbose(_ items: Any)
	{
		log?.verbose(items)
	}
	
	// 普通信息
	open func info(_ items: Any)
	{
		log?.info(items)
		cloud?.sendNow()
	}
	
	// 警告信息
	open func warning(_ items: Any)
	{
		log?.warning(items)
	}
	
	// debug 信息
	open func debug(_ items: Any)
	{
		log?.debug(items)
	}
	
	// log 发送到server 服务器
	open func sendServer()
	{
		cloud!.sendNow()
	}
}
