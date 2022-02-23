//
//  MoviesInteractor.swift
//  CiceTmdbApp
//
//  Created by CICE on 23/02/2022.
//

import Foundation

// Input Interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol{
    func fetchDataNowPlayingInteractor()
}

// Output Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    
    // MARK: - DI
    weak var viewModel: MoviesInteractorOutputProtocol?{
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    // MARK: - DI
    var provider: MoviesProviderInputProtocol?{
        super.baseProvider as? MoviesProviderInputProtocol
    }
}

// Input interactor
extension MoviesInteractor: MoviesInteractorInputProtocol{
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
}

// Output Provider
extension MoviesInteractor: MoviesProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    
}
