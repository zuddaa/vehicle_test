//
//  UserLocalDataSource.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

private let ACCES_TOKEN_KEY = "token"
private let USER_ID_KEY = "userId"

public class UserLocalDataSource {
    func saveTokens(tokens: [String:String]){
        UserDefaults.standard.set(tokens[ACCES_TOKEN_KEY], forKey: ACCES_TOKEN_KEY)
        UserDefaults.standard.set(tokens[USER_ID_KEY], forKey: USER_ID_KEY)
    }
    
    func getToken(key: String) -> String{
        let str = UserDefaults.standard.object(forKey: key) as? String
        return str == nil ? "" : str!
    }
  public init(){
    
  }
}
