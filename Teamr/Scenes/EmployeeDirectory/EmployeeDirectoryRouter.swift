//
//  EmployeeDirectoryRouter.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import UIKit

struct EmployeeDirectoryRouter: EmployeeDirectoryRoutable {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension EmployeeDirectoryRouter {
    
    func route(to screen: Routables) {
        guard let viewController = screen.toViewController() else { return }
        
        // There can be different methods to present or show/pop etc. here...
        
        self.viewController?.present(viewController, animated: true)
    }
}
