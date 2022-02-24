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
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
    func fetchDataUpcomingInteractor()
}

// Output Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationTopRated(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>)
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
    
    // Metodos
    func transformDataResultToMoviesTVModelView(data: [ResultNowPlaying]?) -> [MoviesTVModelView]? {
        var dataSourceMoviesTV: [MoviesTVModelView] = []
        if let dataUnw = data{
            for index in 0..<dataUnw.count{
                let object = MoviesTVModelView(id: dataUnw[index].id,
                                               backdropPath: dataUnw[index].backdropPath,
                                               posterPath: dataUnw[index].posterPath,
                                               name: dataUnw[index].originalTitle)
                dataSourceMoviesTV.append(object)
            }
        }
        return dataSourceMoviesTV
    }
}

// Input interactor
extension MoviesInteractor: MoviesInteractorInputProtocol{
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRatedInteractor() {
        self.provider?.fetchDataTopRatedProvider()
    }
    
    func fetchDataUpcomingInteractor() {
        self.provider?.fetchDataUpcomingProvider()
    }
}

// Output Provider
extension MoviesInteractor: MoviesProviderOutputProtocol{
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRated(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoTopRatedViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoUpcomingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
