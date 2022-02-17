//
//  GenericWebViewPresenter.swift
//  CiceMusic
//
//  Created by CICE on 17/02/2022.
//

import Foundation

protocol GenericWebPresenterInputProtocol {
    
}

final class GenericWebPresenter {
    
    var viewController: GenericWebOutputPresenterProtocol?
    
}

extension GenericWebPresenter: GenericWebPresenterInputProtocol {
    
}
