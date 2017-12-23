//
//  tinypngTests.swift
//  tinypngTests
//
//  Created by jokechat on 2017/12/23.
//  Copyright © 2017年 jokechat. All rights reserved.
//

import XCTest
import Alamofire
@testable import tinypng

class tinypngTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let parameters: Parameters = ["foo": "bar"]
        let urlString = "http://wuye.oyaoyin.com/api/news/getList/cid/2"
        //         let urlString = "https://api.jokechat.cn/api/ip/index"
        Alamofire.request(urlString, method: .get, parameters: parameters)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                debugPrint("Progress: \(progress.fractionCompleted)")
            }
            .validate({ (request, response, data) -> Request.ValidationResult in
                debugPrint("校验代码")
                return .success
            })
            .responseJSON { response in
                debugPrint(response)
            }
            .responseString { (data) in
                debugPrint(data)
        }
        
        sleep(3);
        debugPrint("暂停后消息")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        debugPrint("指定单元测试")
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHello()
    {
       debugPrint("测试helo")
    }
    
}
