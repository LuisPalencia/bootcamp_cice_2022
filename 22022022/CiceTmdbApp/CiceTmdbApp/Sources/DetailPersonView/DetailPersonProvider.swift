/*

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import Combine

// Input Protocol
protocol DetailPersonProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailPersonProvider()
}

final class DetailPersonProvider: BaseProvider{
    
    // MARK: - DI
    weak var interactor: DetailPersonProviderOutputProtocol?{
        super.baseInteractor as? DetailPersonProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailPersonCoordinatorDTO?
    
}

extension DetailPersonProvider: DetailPersonProviderInputProtocol{
    
    // ->Este metodo nos muestra la forma de suscripcion del metodo al AnyPublisher
     
    func fetchDataDetailPersonProvider(){
        self.networkService.requestGeneric(payloadRequest: DetailPersonRequestDTO.requestDataDetail(idPerson: "\(dataDTO?.dataId ?? 0)", moreParams: "movie_credits,tv_credits"), entityClass: DetailPersonServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationDetailPerson(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationDetailPerson(completion: .success(resultData))
            }
            .store(in: &cancellable)
    }
 
    
}

// MARK: - Request de apoyo
struct DetailPersonRequestDTO {
    
    static func requestDataDetail(idPerson: String, moreParams: String) -> RequestDTO {
        let argument: [CVarArg] = [idPerson, moreParams]
        let urlComplete = String(format: URLEnpoint.endpointDetailPerson, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}

