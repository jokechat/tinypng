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
		
		log.sendServer()
	}
}
