//
//  UITableView.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import UIKit
import TinyConstraints

// These are subscripts that i imported over, that help with keeping code clean and loading cells.

public extension UITableView {
    static let defaultCellIdentifier = "Cell"
    
    func register<T: UITableViewCell>(nib type: T.Type, inBundle bundle: Bundle? = nil) {
        let identifier = String(describing: type.self)
        register(
            UINib(nibName: identifier, bundle: bundle),
            forCellReuseIdentifier: identifier
        )
    }
}

public extension UITableView {
    static let defaultHeaderFooterIdentifier = "Header"
    
    func register<T: UITableViewHeaderFooterView>(nib type: T.Type, withIdentifier identifier: String = UITableView.defaultHeaderFooterIdentifier, inBundle bundle: Bundle? = nil) {
        register(
            UINib(nibName: String(describing: type), bundle: bundle),
            forHeaderFooterViewReuseIdentifier: identifier
        )
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? {
        return dequeueReusableHeaderFooterView(withIdentifier: UITableView.defaultHeaderFooterIdentifier) as? T
    }
}

public extension UITableView {
    
    subscript<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameter indexPath: The index path of the cell from the table.
    subscript(indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
    }
    
    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameter indexPath: The index path of the cell from the table.
    subscript<T: UITableViewCell>(indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
    
    /// Gets the reusable cell with the specified identifier name.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the cell from the table.
    ///   - identifier: Name of the reusable cell identifier.
    subscript(indexPath: IndexPath, withIdentifier identifier: String) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
    
    /// Gets the reusable cell with default identifier name.
    ///
    /// - Parameters:
    ///   - indexPath: The index path of the cell from the table.
    ///   - identifier: Name of the reusable cell identifier.
    subscript<T: UITableViewCell>(indexPath: IndexPath, withIdentifier identifier: String) -> T {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}


extension UITableView {
    
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emptyView.backgroundColor = .white
        titleLabel.textColor = .black
        messageLabel.textColor = .black
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        messageLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerInSuperview()
        messageLabel.centerInSuperview(offset: CGPoint(x: 0, y: 30), priority: .required, isActive: true, usingSafeArea: false)
        
        titleLabel.text = title
        messageLabel.text = message
        
        messageLabel.numberOfLines = 0
        
        messageLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        
        self.backgroundView = emptyView
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
