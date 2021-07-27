//
//  Router.swift
//  ACMVP
//
//  Created by AppCraft LLC on 8/27/21.
//

import UIKit

public protocol RouterInput: AnyObject {
    var _mainController: UIViewController? { get set }
    
    func dismiss(animated: Bool)
    func goBack(animated: Bool)
    func goToRoot(animated: Bool)
}

open class Router: RouterInput {
    
    // MARK: - Props
    public weak var _mainController: UIViewController?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - RouterInputProtocol
    
    open func dismiss(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?._mainController?.dismiss(animated: animated, completion: nil)
        }
    }
    
    open func goBack(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?._mainController?.navigationController?.popViewController(animated: animated)
        }
    }
    
    open func goToRoot(animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?._mainController?.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    // MARK: - Module functions
    
    open func present(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?._mainController?.present(viewController, animated: animated, completion: nil)
        }
    }
    
    open func push(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?._mainController?.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
}
