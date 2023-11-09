//
//  Config.swift
//  SOM AI
//
//  Created by Bagas Ilham on 06/11/2023.
//

import Foundation

struct Config {
    struct API {
        static let baseDomain: String = {
            guard let urlString = Bundle.main.infoDictionary?["BASE_DOMAIN"] as? String else {
                return ""
            }
            return urlString
        }()

        static let baseApiUrl: URL = {
            guard let url = Bundle.main.infoDictionary?["BASE_API_URL"] as? String else {
                return URL(string: "")!
            }
            return URL(string: url)!
        }()
        
        static let callbackUrl: String = {
            guard let url = Bundle.main.infoDictionary?["CALLBACK_URL"] as? String else {
                return ""
            }
            return url
        }()

        static let googleSignInClientId: String = {
            guard let clientId = Bundle.main.infoDictionary?["GOOGLE_SIGN_IN_CLIENT_ID"] as? String else {
                return ""
            }
            return clientId
        }()
    }

    struct Networking {
        static let enableLogger = { () -> Bool in
            #if DEBUG
                return true
            #else
                return false
            #endif
        }()
    }
}
