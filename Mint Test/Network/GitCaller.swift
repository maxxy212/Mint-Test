//
//  GitCaller.swift
//  Mint Test
//
//  Created by Maxwell Nwanna on 28/07/2020.
//  Copyright © 2020 Maxwell. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import Realm
import RealmSwift

class GitCaller{
    static func getCommit(completionHandler: @escaping (NetworkResponseModel) -> Void){
        DispatchQueue.global(qos: .background).async {
            let endpoint = "http://api.github.com/repos/rails/rails/commits"
            AF.request(endpoint)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[Commit], AFError>) in
                
                var networkResponse = NetworkResponseModel(statusCode: response.response?.statusCode ?? 0)
                //Attempt to print result value which returns empty Array
                //let eventArray = response.result
               // print(eventArray)
                
                switch response.result{
                case .success(let commit):
                    do{
                        let realm = try Realm()
                        try realm.write{
                            for comm in commit{
                                realm.create(Commit.self, value: comm, update: .modified)
                            }
                        }
                        networkResponse.success = true
                        networkResponse.data = commit
                    }catch{
                        print(error)
                    }
                case .failure(let err):
                    if response.response == nil {
                        networkResponse = NetworkResponseModel()
                        networkResponse.generalMessage = err.localizedDescription
                        networkResponse.success = false
                    }else{
                        guard let data = response.data else {
                            return
                        }
                        
                        guard let error = response.error else {
                            return
                        }
                        
                        guard let responJSON = try? JSON(data: data) else {
                            return
                        }
                        
                        networkResponse = NetworkResponseModel(statusCode: (response.response?.statusCode ?? 0), error: error, data: responJSON)
                        
                        if let msg = responJSON["message"].string{
                            networkResponse.title = msg
                        }
                        networkResponse.success = false
                        networkResponse.generalMessage = error.errorDescription
                    }
                    break
                }
                
                completionHandler(networkResponse)
            })
            
        }
    }
}
