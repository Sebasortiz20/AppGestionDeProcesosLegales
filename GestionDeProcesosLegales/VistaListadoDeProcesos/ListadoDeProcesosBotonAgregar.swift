//
//  ListadoDeProcesosBotonAgregar.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 11/04/23.
//

import UIKit

protocol ListadoDeProcesosBotonAgregarProtocol: AnyObject {
    func botonAgregarPresionado()
}
class ListadoDeProcesosBotonAgregar: UIButton {
    
    private weak var miJefe: ListadoDeProcesosBotonAgregarProtocol?
    
    func asignarJefe(_ jefe: ListadoDeProcesosBotonAgregarProtocol) {
        miJefe = jefe
    }
    
    private struct Constantes {
        static let anchoDelBorde: CGFloat = 2.0
        static let radioDeLasEsquinas: CGFloat = 6.0
        static let titulo = "Agregar"
        static let colorFondo: UIColor = .blue
        static let colorBorde: UIColor = .white
    }
    
    init() {
        super.init(frame: .zero)
        personalizarBotonAgregar()
        configurarAccionDelBotonAgregar()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func personalizarBotonAgregar() {
        self.setTitle(Constantes.titulo, for: .normal)
        self.backgroundColor = Constantes.colorFondo
        self.layer.borderWidth = Constantes.anchoDelBorde
        self.layer.borderColor = Constantes.colorBorde.cgColor
        self.layer.cornerRadius = Constantes.radioDeLasEsquinas
    }

    func configurarAccionDelBotonAgregar() {
        self.addTarget(self, action: #selector(botonAgregarPresionado), for: .touchUpInside)
    }
    
    @objc private func botonAgregarPresionado() {
        guard let miJefe = miJefe else {
            return }
        miJefe.botonAgregarPresionado()
    }
}
