//
//  tinypngTests.swift
//  tinypngTests
//
//  Created by jokechat on 2017/12/23.
//  Copyright © 2017年 jokechat. All rights reserved.
//

import XCTest
import Alamofire
import SwiftyBeaver
@testable import tinypng

class logTests: XCTestCase {
	
    func testHello()
    {
       let log = SwiftyBeaver.self
		// add log destinations. at least one is needed!
		let console = ConsoleDestination()  // log to Xcode Console
		let file = FileDestination()  // log to default swiftybeaver.log file
		let domain = URL.init(string: "http://api.jokechat.cn/api/index/hello")
		let cloud = SBPlatformDestination(appID: "1", appSecret: "1", encryptionKey: "qgQbrA4psxzgManlfe0cf1jxry9p2c07") // to cloud
		
		// use custom format and set console output to short time, log level & message
		console.format = "$DHH:mm:ss$d $L $M"
		// or use this for JSON output: console.format = "$J"
		
		// add the destinations to SwiftyBeaver
		log.addDestination(console)
		log.addDestination(file)
		log.addDestination(cloud)
		
		file.logFileURL = URL(fileURLWithPath: "/Users/jokechat/develop/log/tinypng.log")
		
		
		// log anything!
		log.verbose(123)
		
		cloud.serverURL = domain
		cloud.sendNow()
		
		sleep(5)
    }
    
}
