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

class logTests: XCTestCase
{
	func testLog()
	{
		let  log = Log();
		log.info("123")
		log.warning("警告信息 ⚠️")

//		log.sendServer()
	}
	
	func testHttp()
	{
		let http = Http();
		let params: Parameters = ["foo": "bar"]
		let queryUrl	= "http://api.jokechat.cn/api/ip/getIpInfo/ip/114.114.114.114";
        
        
        let  log = Log();
        log.info("处理响应结果")
        http.callWebServer(queryUrl: queryUrl, params: params, success: { (arg) in
            
			let (result, _) = arg
            log.warning("得到数据")
           log.warning(result)
            
            
        }) { (result,yu) in
//            let (result, yu) = arg
            log.warning(result)
        }
		
//        var result = http.callWebServer(queryUrl: queryUrl, params: params)
		
		sleep(2)
	}
}
