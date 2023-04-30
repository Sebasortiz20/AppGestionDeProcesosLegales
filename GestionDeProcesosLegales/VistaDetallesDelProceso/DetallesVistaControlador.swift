//
//  DetallesVistaControlador.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol DetallesVistaControladorProtocolo: AnyObject {
    func PresentarError(con mensaje: String)
}

class DetallesVistaControlador: UIViewController {
    
    private let cerebro: DetallesCerebroProtocolo
    private var numeroRadicado: String
    
    init(cerebro: DetallesCerebroProtocolo, radicado: String) {
        self.cerebro = cerebro
        self.numeroRadicado = radicado
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
        cerebro.asignarRadicado(self.numeroRadicado)
        cerebro.procesarViewDidLoad()
    }
}

extension DetallesVistaControlador: DetallesVistaControladorProtocolo {
    func PresentarError(con mensaje: String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
        let accionOk = UIAlertAction(title: "OK", style: .default)
        alerta.addAction(accionOk)
        present(alerta, animated: true)
    }
}
