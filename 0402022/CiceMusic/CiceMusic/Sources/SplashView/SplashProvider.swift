//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by CICE on 07/02/2022.
//

import Foundation


protocol SplashProviderInputProtocol {
    func fetchData(completionHandler: @escaping (Result<AppleServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<AppleServerModel, NetworkError>) -> Void) {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "20"),
                                           entityClass: AppleServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }
    }
    
    
}

struct SplashRequestDTO {
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
