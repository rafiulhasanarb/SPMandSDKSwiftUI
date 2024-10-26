//
//  KeychainBootcamp.swift
//  SPMandSDKSwiftUI
//
//  Created by Rafiul Hasan on 10/25/24.
//

import SwiftUI
import KeychainSwift

// keychain is similar to Userdefaults or AppStorage
// Keychain is encrypted
// Keychain is good for password, ssn, credit card info, sensitive data
// Keychain persists between installs and across devices

final class KeychainManager {
    private let keychain: KeychainSwift
    
    init() {
        let keychain = KeychainSwift()
        keychain.synchronizable = true
        self.keychain = keychain
    }
    
    func set(_ value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func get(key: String) -> String? {
        keychain.get(key)
    }
}

struct KeychainManagerKey: EnvironmentKey {
    static let defaultValue: KeychainManager = KeychainManager()
}

extension EnvironmentValues {
    var keychain: KeychainManager {
        get{self[KeychainManagerKey.self]}
        set{self[KeychainManagerKey.self] = newValue}
    }
}

struct KeychainBootcamp: View {
    
    //@Environment(\.keychain) var keychain
    //let keychainManager = KeychainManager()
    //@State private var userPassword: String = ""
    @KeychainStorage(key: "user_password") var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No password" : userPassword) {
            let newPassword = "abcd12345"
            userPassword = newPassword
            //keychain.set(newPassword, key: "user_password")
            //keychain.set(newPassword, key: "")//, withAccess: .accessibleWhenUnlocked
            //userPassword = newPassword
            //keychain.delete("")
            //keychain.clear()
        }
        //.onAppear {
            //userPassword = keychain.get(key: "user_password") ?? ""
        //}
    }
}

#Preview {
    KeychainBootcamp()
}

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    @State private var newValue: String
    let key: String
    let keychain: KeychainManager
    
    var wrappedValue: String {
        get {
            newValue
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedVAlue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }
    }
    
    init(wrappedValue: String, key: String) {
        self.key = key
        let keychain = KeychainManager()
        
        self.keychain = keychain
        newValue = keychain.get(key: key) ?? ""
    }
    
    func save(newValue: String) {
        keychain.set(newValue, key: key)
        self.newValue = newValue
    }
}
