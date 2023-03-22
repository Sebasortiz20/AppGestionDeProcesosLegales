//
//  HomeBotonConsultar.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

class HomeBotonConsultar: UIButton {
    
    private struct Constantes {
        static let radioDeLasEsquinas: CGFloat = 7.0
    }
    
    init() {
        super.init(frame: .zero)
        iniciarBoton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func iniciarBoton() {
        self.backgroundColor = .blue
        self.layer.cornerRadius = Constantes.radioDeLasEsquinas
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.setTitle("Consultar", for: .normal)
        self.addTarget(self, action: #selector(mostrarMensaje), for: .touchUpInside)
    }
    
    @objc func mostrarMensaje() {
        print("Hola")
    }
    
}

