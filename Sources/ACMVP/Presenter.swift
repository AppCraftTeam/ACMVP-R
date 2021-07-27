//
//  Presenter.swift
//  ACMVP
//
//  Created by AppCraft LLC on 8/27/21.
//

import UIKit

public protocol PresenterInput: AnyObject {
    var _view: ViewInput? { get set }
    var _router: RouterInput? { get set }
}

open class Presenter: PresenterInput, ViewOutput {
    
    // MARK: - Props
    public weak var _view: ViewInput?
    public var _router: RouterInput?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - PresenterInputProtocol
    
    // MARK: - ViewOutputProtocol
    open func viewIsReady(_ controller: UIViewController) { }
    
    open func loadData() { }
    
    open func reloadData() { }
        
    open func goBack(animated: Bool) {
        self._router?.goBack(animated: animated)
    }
    
    open func close(animated: Bool) {
        self._router?.dismiss(animated: animated)
    }
    
    open func beginLoading() {
        self._view?.beginLoading()
    }
    
    open func finishLoading(with error: Error?) {
        self._view?.finishLoading(with: error)
    }
    
    open func provideMessage(_ title: String?, message: String?) {
        self._view?.show(title: title, message: message, animated: true)
    }
}
