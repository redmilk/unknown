//
//  RemoteConfig.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 12.04.2025.
//

import FirebaseCore
import FirebaseRemoteConfig
import FirebaseRemoteConfigSwift

final class RemoteConfigService {
    
    enum ConfigError: Error {
        case fetchSettingsError
        case encodeError
        case decodingError
        
        var description: String {
            switch self {
            case .fetchSettingsError:
                return "⛔️ ⛔️ ⛔️ Remote config fetch Settings error (status)"
            case .encodeError:
                return "⛔️ ⛔️ ⛔️ Failed to encode JSON string"
            case .decodingError:
                return "⛔️ ⛔️ ⛔️ Failed to decode Remote config DTO"
            }
        }
    }
    
    static let shared = RemoteConfigService()
    private let remoteConfig: RemoteConfig
    
    init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }

    func fetchSettings() async throws -> RemoteConfigDTO.Settings {
        let status = try await remoteConfig.fetchAndActivate()
        guard status != .error else {
            throw ConfigError.fetchSettingsError
        }
        
        let jsonString = remoteConfig["global_settings"].stringValue ?? ""
        guard let data = jsonString.data(using: .utf8) else {
            throw ConfigError.encodeError
        }
        
        do {
            let settings = try JSONDecoder().decode(RemoteConfigDTO.Settings.self, from: data)
            return settings
        } catch {
            throw ConfigError.decodingError
        }
    }
}


