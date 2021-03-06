//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by CICE on 07/02/2022.
//

import Foundation

// Input del Interactor
protocol SplashInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol>{
    
    let splashProvider: SplashProviderInputProtocol = SplashProvider()
    
    
    
}

// Input del Interactor
extension SplashInteractor: SplashInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor() {
        self.splashProvider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case let .success(model):
                self?.presenter?.setDataFromWebInteractor(data: model.menuResponse)
            case .failure(let error):
                self?.presenter?.setAlertMessage(error: error)
            }
        }
    }
}
