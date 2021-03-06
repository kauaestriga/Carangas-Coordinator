//
//  ViewController.swift
//  Carangas
//
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import UIKit

class CarVisualizationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lbBrand: UILabel!
    @IBOutlet weak var lbGasType: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    // MARK: - Properties
    var viewModel: CarVisualizationViewModel?
    weak var coordinator: CarVisualizationCoordinator?

    // MARK: - Super Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let viewModel = viewModel {
            title = viewModel.title
            lbBrand.text = viewModel.brand
            lbGasType.text = viewModel.fuelType
            lbPrice.text = viewModel.price
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CarFormViewController {
            vc.viewModel = viewModel?.getCarFormViewModel()
        }
    }
    
    deinit {
        coordinator?.childDiDFinish(nil)
        print("CarVisualizationViewController -> deinit")
    }
    
    //MARK: - IBActions
    
    @IBAction func editCar(_ sender: Any) {
        guard let viewModel = viewModel else {return}
        coordinator?.editCar(viewModel: viewModel.getCarFormViewModel())
    }
}
