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

import UIKit

// Output del Presenter
protocol TipPresenterOutputProtocol {
    func reloadInformationInView()
}

class TipViewController: BaseView<TipPresenterInputProtocol> {

    
    // MARK: - IBOutlets
    @IBOutlet weak var tipsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        self.presenter?.fetchDataFromWebService()
        self.configuracionTableView()
    }
    
    private func configuracionTableView(){
        self.tipsTableView.delegate = self
        self.tipsTableView.dataSource = self
        self.tipsTableView.register(UINib(nibName: TipCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TipCell.defaultReuseIdentifier)
    }
    


}

// Output del Presenter
extension TipViewController: TipPresenterOutputProtocol {

    func reloadInformationInView() {
        self.tipsTableView.reloadData()
        self.hideLoading()
    }
}

extension TipViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tipCell = self.tipsTableView.dequeueReusableCell(withIdentifier: TipCell.defaultReuseIdentifier, for: indexPath) as! TipCell
        
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row){
            tipCell.setupCell(data: model)
        }
        
        return tipCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.presenter?.informationForCell(indexPath: indexPath.row){
            self.presenter?.didSelectRow(data: model)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
