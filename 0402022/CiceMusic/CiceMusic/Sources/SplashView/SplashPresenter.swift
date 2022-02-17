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
    func setDataFromWebInteractor(data: [MenuResponse]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [MenuResponse] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func showHometabBar() {
        
        
        
        if Utils.Constantes().kPrefer.bool(forKey: Utils.Constantes().kUsuarioLogado){
            self.router?.showHometabBarRouter(dataSource: self.dataSourceViewModel)

        }else{
            self.router?.showLoginViewRouter(dataSource: self.dataSourceViewModel)
        }

    }
}

// OUtput del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [MenuResponse]?) {
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
