//
//  PollData.swift
//  TrumpeJump
//
//  Created by Robin Onsay on 2/27/16.
//  Copyright © 2016 trumpejump. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class PollData{
    static let URL = "https://elections.huffingtonpost.com/pollster/api/polls.json"
    static let GOP_POLL_KEY = "2016 National Republican Primary"
    
    static func getTrumpPollResults(funcSuccess: (results: [JSON])-> Void){
        Alamofire.request(.GET, URL).validate()
            .responseJSON{ response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let key = "questions"
                        var jsonArray = json.arrayValue
                        var pollData:[JSON]!
                        
                        for j in jsonArray{
                            var polls = j[key].arrayValue[0]
                            print(polls["name"])
                            if( polls["name"].string == GOP_POLL_KEY){
                                    pollData = polls["subpopulations"].arrayValue
//                                    print(pollData)
                                    break
                            }
                        }
                        
                        funcSuccess(results: pollData)
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
}