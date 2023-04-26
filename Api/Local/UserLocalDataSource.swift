//
//  UserLocalDataSource.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

private let ACCES_TOKEN_KEY = "token"

public class UserLocalDataSource {
    func saveTokens(tokens: [String:String]){
        UserDefaults.standard.set(tokens[ACCES_TOKEN_KEY], forKey: ACCES_TOKEN_KEY)
    }
    
    func getToken(key: String) -> String{
        let str = UserDefaults.standard.object(forKey: key) as? String
        return str == nil ? "" : str!
    }
  public init(){
    
  }
}
