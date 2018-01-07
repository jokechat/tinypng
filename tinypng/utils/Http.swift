// Http.swift
// tinypng
//
// Created by jokechat  on 2018/1/6.
//Copyright © 2018年 jokechat. All rights reserved.
// 对网络请求的进一步封装

import Foundation
import Alamofire
class Http
{
	
	private enum ValidationError: Error
	{
		case missingData, missingFile, fileReadFailed
	}
	
	
	// 发起网络请求
	open func callWebServer(queryUrl : String,params : [String: Any],
							success: @escaping ((result : String,yu:Int))->(),
							failure: @escaping ((result : String,yu:Int))->())
	{
		let  log = Log();
		log.info("发起网络请求")
		
		Alamofire.request(queryUrl, method: .get, parameters: params)
			.downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
				debugPrint("Progress: \(progress.fractionCompleted)")
			}
			.validate({ (request, response, data) -> Request.ValidationResult in
				if(200 == response.statusCode){
//					log.info("成功响应")
					success(("我说相应数据",yu : 1))
					return .success
				}else{
//					log.verbose("响应错误")
					failure(("怪了,gun",yu : 1))
					return .failure(ValidationError.missingData)
				}
			})
			.responseString { (data) in
				log.warning(data)
			}
	}
	
	
}
