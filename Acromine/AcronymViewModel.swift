//
//  AcronymViewModel.swift
//  Acromine
//
//  Created by Shalinipriya Annadurai on 10/15/21.
//

import Foundation

class AcronymViewModel{
    var acronymList = [Acronym](){
        didSet {
            abbreviationList = acronymList.first?.lfs ?? []
        }
    }
    var abbreviationList = [Abbreviation](){
        didSet {
            bindDataToView()
        }
    }
    var bindDataToView:(()->()) = {}
    
    func getAbbrevation(_ text: String) {
        APIService.shared.getAbbrevation(text){[weak self] result in
            switch result {
            case .success(let ac):
                self?.acronymList = ac
            case .failure(_):
                self?.acronymList = []
            }
        }
    }
}
