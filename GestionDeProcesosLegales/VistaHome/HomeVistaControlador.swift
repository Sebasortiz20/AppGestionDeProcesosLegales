//
//  HomeVistaControlador.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit
protocol HomeVistaControladorProtocolo: AnyObject {
    func navegarHaciaVistaDetalle()
}

class HomeVistaControlador: UIViewController {
    
    private let cerebro: HomeCerebroProtocolo
    
    init(cerebro: HomeCerebroProtocolo) {
        self.cerebro = cerebro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        let homeVista = HomeVistaConstructor.construya() ///asigna a la vista propia del view controller, el UIViewController tiene una var llamada view
        homeVista.asignarJefe(self)
        self.view = homeVista
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cerebro.asiganarVC(viewController: self)  ///cerebroHome su viewController soy yo
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Lista", style: .done, target: self, action: #selector(presentarVistaListado))
    }
    
    @objc private func presentarVistaListado() {
        self.navigationController?.pushViewController(ListadoDeProcesosConstructor.construya(), animated: true)
    }
}

extension HomeVistaControlador: HomeVistaControladorProtocolo {
    func navegarHaciaVistaDetalle() {
        let vc = DetallesConstructor.construya()
        self.navigationController!.pushViewController(vc, animated: true)
    }
}

extension HomeVistaControlador: JefeHomeVista {
    func procesarToqueBotonConsultar() {
        navegarHaciaVistaDetalle()
    }
}
