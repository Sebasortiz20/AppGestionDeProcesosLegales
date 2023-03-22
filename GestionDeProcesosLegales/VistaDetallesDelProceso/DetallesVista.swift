//
//  DetallesVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 15/03/23.
//

import UIKit

protocol DetallesVistaProtocolo where Self: UIView {
    
}

class DetallesVista: UIView, DetallesVistaProtocolo {
    
    // Subvista azul que cubrirá toda la pantalla
    private let subvistaAzul: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        configurarSubvistaAzul()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configurarSubvistaAzul() {
        // Añadir la subvista azul
        self.addSubview(subvistaAzul)
        
        // Agregar constraints para que la subvista ocupe toda la pantalla
        NSLayoutConstraint.activate([
            subvistaAzul.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            subvistaAzul.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            subvistaAzul.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            subvistaAzul.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
