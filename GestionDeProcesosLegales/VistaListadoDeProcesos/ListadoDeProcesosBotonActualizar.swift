//
//  ListadoDeProcesosBotonActualizar.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 11/04/23.
//

import UIKit

protocol ListadoDeProcesosBotonActualizarProtocol: AnyObject {
    func botonActualizarPresionado()
}

class ListadoDeProcesosBotonActualizar: UIButton {
    
    private weak var miJefe: ListadoDeProcesosBotonActualizarProtocol?
    
    func asignarJefe(_ jefe: ListadoDeProcesosBotonActualizarProtocol) {
        miJefe = jefe
    }
    
    private struct Constantes {
        static let anchoDelBorde: CGFloat = 2.0
        static let radioDeLasEsquinas: CGFloat = 6.0
        static let titulo = "Actualizar"
        static let colorFondo: UIColor = .blue
        static let colorBorde: UIColor = .white
    }
    
    init() {
        super.init(frame: .zero)
        personalizarBotonActualizar()
        configurarAccionDelBotonActualizar()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func personalizarBotonActualizar() {
        self.setTitle(Constantes.titulo, for: .normal)
        self.backgroundColor = Constantes.colorFondo
        self.layer.borderWidth = Constantes.anchoDelBorde
        self.layer.borderColor = Constantes.colorBorde.cgColor
        self.layer.cornerRadius = Constantes.radioDeLasEsquinas
    }

    func configurarAccionDelBotonActualizar() {
        self.addTarget(self, action: #selector(actualizarBotonPresionado), for: .touchUpInside)
    }
    
    @objc private func actualizarBotonPresionado() {
        guard let miJefe = miJefe else {
            return }
        miJefe.botonActualizarPresionado()
    }
}
