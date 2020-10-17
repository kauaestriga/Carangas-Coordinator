//
//  Coordinator.swift
//  Carangas
//
//  Created by Usuário Convidado on 17/10/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator] {get set}
    var parentCoordinator: Coordinator? {get set}
    
    func start()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    func childDiDFinish(_ child: Coordinator?)
}

extension Coordinator {
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{$0 !== coordinator}
    }
    
    func childDiDFinish(_ child: Coordinator?) {
        guard let child = child else {return}
        remove(childCoordinator: child)
    }
}