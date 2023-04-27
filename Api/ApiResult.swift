//
//  ApiResult.swift
//  Api
//
//  Created by Izudin Vragic on 26. 4. 2023..
//

import Foundation

public enum ApiResult<Value> {
    case success(Value)
    case error(DomainError)
}
