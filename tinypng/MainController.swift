//
//  ViewController.swift
//  tinypng
//
//  Created by jokechat on 2017/12/23.
//  Copyright © 2017年 jokechat. All rights reserved.
//

import Cocoa
import Alamofire
class MainController: NSViewController {

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
//        let urlString = "http://wuye.oyaoyin.com/api/news/getList/cid/2"
         let urlString = "https://api.jokechat.cn/api/ip/index"
		do {
			Alamofire.request(urlString, method: .get, parameters: parameters)
				.downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
					debugPrint("Progress: \(progress.fractionCompleted)")
				}
				.responseJSON { response in
					debugPrint(response.data!)
				}
				.responseString { (data) in
					debugPrint(data)
				}
			debugPrint("----")
		} catch  {
			debugPrint("-dsdsd--")
		}
	}
}

