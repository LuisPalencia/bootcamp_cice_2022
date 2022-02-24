//
//  MoviesProvider.swift
//  CiceTmdbApp
//
//  Created by CICE on 23/02/2022.
//

import Foundation
import Combine

protocol MoviesProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataNowPlayingProvider()
    func fetchDataPopularProvider()
    func fetchDataTopRatedProvider()
    func fetchDataUpcomingProvider()
}

final class MoviesProvider: BaseProvider {
    
    // MARK: - DI
    weak var interactor: MoviesProviderOutputProtocol?{
        super.baseInteractor as? MoviesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
}

extension MoviesProvider: MoviesProviderInputProtocol{
    func fetchDataNowPlayingProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesNowPlaying,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationNowPlaying(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationNowPlaying(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataPopularProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesPopular,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationPopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationPopular(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTopRatedProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesTopRated,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTopRated(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationTopRated(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataUpcomingProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesUpcoming,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationUpcoming(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationUpcoming(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    
}
