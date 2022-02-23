//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by CICE on 22/02/2022.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject{
    
    // MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [ResultNowPlaying] = []
    
    // MARK: - Metodospublicos
    func fetchData(){
        self.interactor?.fetchDataNowPlayingInteractor()
    }
}

extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
