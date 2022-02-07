//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by CICE on 07/02/2022.
//

import Foundation

// Input del Presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
}

// OUtput del Interactor
protocol SplashInteractorOutputProtocol {
    
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
}

// OUtput del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    
}
