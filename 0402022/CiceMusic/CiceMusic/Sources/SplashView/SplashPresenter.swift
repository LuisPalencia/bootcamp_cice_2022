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
    func setDataFromWebInteractor(data: [GenericResult]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [GenericResult] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func showHometabBar() {
        self.router?.showHometabBarRouter(dataSource: self.dataSourceViewModel)
    }
    
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
}

// OUtput del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?) {
        DispatchQueue.main.async {
            guard let dataUnw = data else { return }
            self.dataSourceViewModel.removeAll()
            self.dataSourceViewModel = dataUnw
            self.viewController?.launchAnimation()
        }
        
    }
    
    func setAlertMessage(error: NetworkError) {
        DispatchQueue.main.async {
            self.router?.showAlert(title: "\(error.status)", message: error.status.rawValue == -1011 ? error.localizedDescription : "AQUI LUIS")
        }
    }
}
