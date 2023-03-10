//
//  SharedPreferences.swift
//  Cryato
//
//  Created by John Melody Me on 09/02/2023.
//

import Foundation

public struct SharedPreferences {
    public var key :String
    public var type :SharedPreferenceType
    public var properties :String?
    
    public init(key :String?, properties :String?, type :SharedPreferenceType?) throws {
        self.key = key!
        self.type = type!
        self.properties = properties!
        
        if type == SharedPreferenceType.SET {
            SharedPreferences.setData(value: self.properties ?? "", key: self.key)
        }
        
        return;
    }

    public static func setData(value: Any, key: String) -> Void {
        let userDefault = UserDefaults.standard
        
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
        
        return;
    }
    
    public static func getData(key :String) -> String {
        let userDefault = UserDefaults.standard
        
        if userDefault.object(forKey: key) == nil {
            return "nil"
        }
        
        return userDefault.string(forKey: key)!
    }
}
