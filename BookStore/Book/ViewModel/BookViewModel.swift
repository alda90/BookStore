//
//  BookViewModel.swift
//  BookStore
//
//  Created by AlDAIR cARRILO on 13/09/21.
//  Copyright © 2021 CGTI. All rights reserved.
//

import Foundation
import UIKit

protocol  bookViewModelProtocol {
    func getResponse(response: Response)
    func getErrorResponse(error:NSString)
}
class BookViewModel: apiCallsProtocol {
    
    private weak var view: BookListViewController?
    //private var router: MainRouter?
    private var apiCall = RestApiCalls()
    private var delegate: bookViewModelProtocol!
    
    
    func bind(view: BookListViewController, delegate: bookViewModelProtocol) {
        self.view = view
        //self.router = router
        self.delegate = delegate
        //bind router with the view
        //self.router?.setSourceView(view)
        apiCall.delegate = self
    }
    
    func isFetching() -> Bool {
        return apiCall.fetching
    }
    
    func getBooks(targetVC: UIViewController, q: String) {
        apiCall.getBooks(targetVC: targetVC, parameters: q)
    }
    
    func getResponse(response: Response) {
        delegate?.getResponse(response: response)
    }
    
    func getErrorResponse(error: NSString) {
        delegate?.getErrorResponse(error: error)
    }
    
    
}
