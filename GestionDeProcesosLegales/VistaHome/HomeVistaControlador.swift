//
//  HomeVistaControlador.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol HomeVistaControladorProtocolo: AnyObject {
    
}

class HomeVistaControlador: UIViewController {   /// inyectamos las dependencias a traves de un Contructor
    let cerebro: HomeCerebroProtocolo
    init(cerebro: HomeCerebroProtocolo) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
      self.view = HomeVistaConstructor.construya() ///asigna a la vista propia del view controller, el UIViewController tiene una var llamada view
    }
}

extension HomeVistaControlador: HomeVistaControladorProtocolo {
    
}
