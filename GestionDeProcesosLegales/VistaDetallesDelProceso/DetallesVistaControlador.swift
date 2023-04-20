//
//  DetallesVistaControlador.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol DetallesVistaControladorProtocolo: AnyObject {
    
}

class DetallesVistaControlador: UIViewController {
    
    private let cerebro: DetallesCerebroProtocolo
    
    init(cerebro: DetallesCerebroProtocolo) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = DetallesVistaConstructor.construya()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cerebro.asiganarVC(viewController: self) ///cerebroDetalles su viewController soy yo
    }
}

extension DetallesVistaControlador: DetallesVistaControladorProtocolo {
    
}
