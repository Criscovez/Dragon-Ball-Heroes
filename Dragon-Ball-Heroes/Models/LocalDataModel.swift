//
//  LocalDataModel.swift
//  Dragon-Ball-Heroes
//
//  Created by Cristian Contreras Velásquez on 16-01-24.
//

import Foundation

struct LocalDataModel {
    private enum Constants {
        static let tokenKey = "KCTToken"
    }
    
    private static let userDefaults = UserDefaults.standard
    
    static func getToken () -> String? {
        userDefaults.string(forKey: Constants.tokenKey)
    }
    
    static func save(token: String) {
        userDefaults.set(token,forKey: Constants.tokenKey)
        
    }
    
    static func deleteToken() {
        userDefaults.removeObject(forKey: Constants.tokenKey)
    }
}
