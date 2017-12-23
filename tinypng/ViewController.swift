//
//  ViewController.swift
//  tinypng
//
//  Created by jokechat on 2017/12/23.
//  Copyright © 2017年 jokechat. All rights reserved.
//

import Cocoa
import Alamofire
class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func clickSettings(_ sender: AnyObject) {
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
    }
}

