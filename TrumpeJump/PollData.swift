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
    static let GOP_POLL = 0
    static let DEM_POLL = 1
    static let NAME_KEY = "name"
    static let POLL_DATA_KEY = "subpopulations"
    static let QUESTIONS_KEY = "questions"
    
    static func getTrumpPollResults(funcSuccess: (pollResults: [JSON])-> Void){
        Alamofire.request(.GET, URL).validate()
            .responseJSON{ response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        
                        let jsonArray = json.arrayValue[0]
//                        print(jsonArray)
                        var pollsGOP = jsonArray[QUESTIONS_KEY].arrayValue[GOP_POLL]
                        var pollsDem = jsonArray[QUESTIONS_KEY].arrayValue[DEM_POLL]
//                        print("\n\(jsonArray[QUESTIONS_KEY].arrayValue[0])")
                        
                        var pollData = [pollsGOP[POLL_DATA_KEY].arrayValue.first!.dictionaryValue, pollsDem[POLL_DATA_KEY].arrayValue.first!.dictionaryValue]
                        print(pollData)
                    }
                case .Failure(let error):
                    print(error)
                }
        }
    }
}