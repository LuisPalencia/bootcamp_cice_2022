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
    func showHometabBar()
}

// OUtput del Interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSource: [ResultMusic] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func showHometabBar() {
        self.router?.showHometabBarRouter(dataSource: self.dataSource)
    }
    
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
}

// OUtput del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?) {
        guard let dataUnw = data else { return }
        self.dataSource.removeAll()
        self.dataSource = dataUnw
        self.viewController?.launchAnimation()
    }
}
