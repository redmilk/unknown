//
//  APIError.swift
//  Unknown
//
//  Created by Danyl Timofeyev on 31.05.2024.
//

import Foundation

public enum APIError: String, Error {
    case unknown
    case badRequest
    case serializationFailure
    case unauthorized
    case phoneNotFound
    case encryptionFailure
    case networkFailure
    case databaseError
    case phoneAndDigitsCombinationNotFound = "PhoneAndDigitsCombinationNotFoundException"
    case invalidArguments = "InvalidArguments"
    case cardLoginExpired = "CardLoginExpiredException"
    case challengeNotAccepted = "ChallengeNotAcceptedException"
    case blockedCredentials = "BlockedCredentialsException"
    case apiConnectivityException = "CbhApiConnectivityException"
    case invalidURL
    case serverError = "serverError"
    
    public var localizedDescription: String {
        switch self {
        case _: return "he-he"
//        case .unknown: return LS.APIErrors.unknown
//        case .badRequest: return R.string.localizable.badRequest()
//        case .serializationFailure: return LS.APIErrors.serializationFailed
//        case .unauthorized: return LS.APIErrors.unauthorized
//        case .phoneNotFound: return LS.APIErrors.phoneNotFound
//        case .encryptionFailure: return LS.APIErrors.encryptionFailure
//        case .networkFailure: return LS.APIErrors.networkFailure
//        case .databaseError: return R.string.localizable.internalDatabaseError()
//        case .phoneAndDigitsCombinationNotFound: return LS.Alert.authFailureTitle
//        case .invalidArguments: return LS.APIErrors.invalidArguments
//        case .cardLoginExpired: return LS.APIErrors.loginExpired
//        case .challengeNotAccepted: return R.string.localizable.challengeNotAccepted()
//        case .blockedCredentials: return R.string.localizable.blockedCredentials()
//        case .apiConnectivityException: return R.string.localizable.apiConnectivityException()
//        case .invalidURL: return R.string.localizable.invalidURL()
//        case .serverError: return "Server Error"
        }
    }
    
    //{"jsonapi":{"version":"1.1"},"errors":[{"id":"PhoneAndDigitsCombinationNotFoundException","status":"400"}]}
     public static func parse(legacyNetworkResponse: Data?) -> APIError {
        guard let data = legacyNetworkResponse,
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let errors = json["errors"] as? [[String: Any]],
              let firstError = errors.first?["id"] as? String,
              let apiError = APIError(rawValue: firstError)
        else {
            return .networkFailure
        }
        return apiError
    }
}
