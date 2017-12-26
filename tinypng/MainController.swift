//
//  ViewController.swift
//  tinypng
//
//  Created by jokechat on 2017/12/23.
//  Copyright © 2017年 jokechat. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyBeaver

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
		
		
		
		let log = SwiftyBeaver.self
		
		// add log destinations. at least one is needed!
		let console = ConsoleDestination()  // log to Xcode Console
		let file = FileDestination()  // log to default swiftybeaver.log file
		let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud
		
		// use custom format and set console output to short time, log level & message
		console.format = "$DHH:mm:ss$d $L $M"
		// or use this for JSON output: console.format = "$J"
		
		// add the destinations to SwiftyBeaver
		log.addDestination(console)
		log.addDestination(file)
		log.addDestination(cloud)
		
		// Now let’s log!
		log.verbose("not so important")  // prio 1, VERBOSE in silver
		log.debug("something to debug")  // prio 2, DEBUG in green
		log.info("a nice information")   // prio 3, INFO in blue
		log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
		log.error("ouch, an error did occur!")  // prio 5, ERROR in red
		
		// log anything!
		log.verbose(123)
		log.info(-123.45678)
		log.warning(Date())
		log.error(["I", "like", "logs!"])
		log.error(["name": "Mr Beaver", "address": "7 Beaver Lodge"])
		
		
		
        let parameters: Parameters = ["foo": "bar"]
//        let urlString = "http://wuye.oyaoyin.com/api/news/getList/cid/2"
         let urlString = "https://api.jokechat.cn/api/ip/index"
		do {
			Alamofire.request(urlString, method: .get, parameters: parameters)
				.downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
					log.info("Progress: \(progress.fractionCompleted)")
				}
				.responseJSON { response in
					log.info(response.data!)
				}
				.responseString { (data) in
					log.info(data)
				}
			
		} catch  {
			
		}
	}
}

