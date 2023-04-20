//
//  HomeBotonConsultar.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol JefeHomeBotonConsultar: AnyObject {
    func botonConsultarPresionado()
}

class HomeBotonConsultar: UIButton {
    
    private weak var miJefe: JefeHomeBotonConsultar?

    private struct Constantes {
        static let radioDeLasEsquinas: CGFloat = 7.0
        static let titulo = "Consultar"
        static let colorFondo: UIColor = .blue
        static let anchoBorde: CGFloat = 3.0
        static let colorBorde: UIColor = .white
    }
    
    init() {
        super.init(frame: .zero)
        personalizarBoton()
        configurarAccionDelBotonNavegar()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func asignarJefe(_ jefe: JefeHomeBotonConsultar) {
        miJefe = jefe
    }
    
    private func personalizarBoton() {
        self.backgroundColor = Constantes.colorFondo
        self.layer.cornerRadius = Constantes.radioDeLasEsquinas
        self.layer.borderWidth = Constantes.anchoBorde
        self.layer.borderColor = Constantes.colorBorde.cgColor
        self.setTitle(Constantes.titulo, for: .normal)
    }
    
    private func configurarAccionDelBotonNavegar() {
        self.addTarget(self, action: #selector(navegarHaciaVistaDetalles), for: .touchUpInside)
    }
    
    @objc func navegarHaciaVistaDetalles(_ sender: Any) {
        guard let miJefe = miJefe else { return }
        miJefe.botonConsultarPresionado()
    }
}
