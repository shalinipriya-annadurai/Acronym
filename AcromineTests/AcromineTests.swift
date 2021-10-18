//
//  AcromineTests.swift
//  AcromineTests
//
//  Created by Ganesh Malaiyappan on 10/13/21.
//

import XCTest
@testable import Acromine

class AcromineTests: XCTestCase {
    let viewModel = AcronymViewModel()
    
    func testViewModel() {
        XCTAssertNotNil(viewModel)
        XCTAssertNotNil(viewModel.abbreviationList)
        XCTAssertNotNil(viewModel.acronymList)
        XCTAssertEqual(viewModel.abbreviationList.count, 0)
        XCTAssertEqual(viewModel.acronymList.count, 0)
    }
    
    func testModel(){
        let json = """
        [{"sf": "HMM", "lfs": [{"lf": "heavy meromyosin", "freq": 267, "since": 1971, "vars": [{"lf": "heavy meromyosin", "freq": 244, "since": 1971}, {"lf": "Heavy meromyosin", "freq": 12, "since": 1975}, {"lf": "H-meromyosin", "freq": 5, "since": 1975}, {"lf": "heavy-meromyosin", "freq": 4, "since": 1977}, {"lf": "heavy  meromyosin", "freq": 1, "since": 1976}, {"lf": "H-Meromyosin", "freq": 1, "since": 1976}]}, {"lf": "hidden Markov model", "freq": 245, "since": 1990, "vars": [{"lf": "hidden Markov model", "freq": 148, "since": 1992}, {"lf": "Hidden Markov Model", "freq": 29, "since": 1993}, {"lf": "hidden Markov models", "freq": 26, "since": 1995}, {"lf": "Hidden Markov Models", "freq": 13, "since": 2001}, {"lf": "Hidden Markov model", "freq": 9, "since": 1994}, {"lf": "Hidden Markov models", "freq": 6, "since": 1995}, {"lf": "Hidden Markov Modeling", "freq": 2, "since": 2007}, {"lf": "hidden Markov Model", "freq": 2, "since": 2008}, {"lf": "Hidden Markov modeling", "freq": 2, "since": 2000}, {"lf": "hidden Markov modeling", "freq": 2, "since": 1990}, {"lf": "Hidden-Markov Model", "freq": 1, "since": 2008}, {"lf": "Hidden Markov modelling", "freq": 1, "since": 1990}, {"lf": "hidden markov models", "freq": 1, "since": 2000}, {"lf": "hidden markov model", "freq": 1, "since": 2005}, {"lf": "hidden-Markov-model", "freq": 1, "since": 1996}, {"lf": "Hidden-Markov-Model", "freq": 1, "since": 2004}]}, {"lf": "hexamethylmelamine", "freq": 55, "since": 1976, "vars": [{"lf": "hexamethylmelamine", "freq": 45, "since": 1977}, {"lf": "Hexamethylmelamine", "freq": 10, "since": 1976}]}, {"lf": "high molecular mass", "freq": 44, "since": 1982, "vars": [{"lf": "high molecular mass", "freq": 26, "since": 1982}, {"lf": "high-molecular-mass", "freq": 17, "since": 1991}, {"lf": "High molecular mass", "freq": 1, "since": 2001}]}, {"lf": "human malignant mesothelioma", "freq": 17, "since": 1986, "vars": [{"lf": "human malignant mesothelioma", "freq": 4, "since": 1990}, {"lf": "human monocyte-derived macrophages", "freq": 3, "since": 1991}, {"lf": "human monocyte-macrophages", "freq": 3, "since": 1990}, {"lf": "Human malignant mesothelioma", "freq": 3, "since": 2005}, {"lf": "Human monocyte-derived macrophages", "freq": 2, "since": 1986}, {"lf": "human monocyte-macrophage", "freq": 2, "since": 1999}]}, {"lf": "hydroxymethylmexiletine", "freq": 8, "since": 1990, "vars": [{"lf": "hydroxymethylmexiletine", "freq": 8, "since": 1990}]}, {"lf": "Home Management of Malaria", "freq": 5, "since": 2006, "vars": [{"lf": "Home Management of Malaria", "freq": 3, "since": 2006}, {"lf": "home management of malaria", "freq": 2, "since": 2007}]}, {"lf": "6a-hydroxymaackiain 3-O-methyltransferase", "freq": 3, "since": 1997, "vars": [{"lf": "6a-hydroxymaackiain 3-O-methyltransferase", "freq": 3, "since": 1997}]}]}]
        """
        
        guard let data = json.data(using: .utf8) else { return  }
        let list = try? JSONDecoder().decode([Acronym].self, from: data)
        XCTAssertNotNil(list)
        XCTAssertTrue(list!.count > 0)
        
    }
    
    func testGetRequest() {
        APIService.shared.getAbbrevation("HMM") { result in
            switch result {
            case .success(let list):
                XCTAssertNotNil(list)
            case .failure(let e):
                XCTAssertNil(e)
            }
        }
    }
}
