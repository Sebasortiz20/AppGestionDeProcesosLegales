//
//  ProcesoTableViewCell.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 5/04/23.
//

import UIKit

protocol ProcesoTableViewCellProtocol {
    func asignarRadicadoAlProceso(_ radicado: String)
    func asignarIdAlProceso(_ Id: String)
}

class ProcesoTableViewCell: UITableViewCell {
    
    let radicadoLabel = UILabel()
    let idLabel = UILabel()
    
    var proceso: ProcesoDominio?
    
    private struct Constantes {
        static let texto = "Radicado:"
        static let tamañoFuenteRadicado: CGFloat = 18.0
        static let tamañoFuenteId: CGFloat = 16.0
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configurarCelda()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configurarCelda() {
        agregarElementosEnLaCelda()
        personalizarRadicadoLabel()
        personalizarIdLabel()
        posicionarRadicadoLabel()
        posicionarIdLabel()
    }
    
    func agregarElementosEnLaCelda() {
        addSubview(radicadoLabel)
        addSubview(idLabel)
    }
    
    func personalizarRadicadoLabel() {
        radicadoLabel.font = UIFont.boldSystemFont(ofSize: Constantes.tamañoFuenteRadicado)
        radicadoLabel.text = Constantes.texto
    }
    
    func personalizarIdLabel() {
        idLabel.font = UIFont.systemFont(ofSize: Constantes.tamañoFuenteId)
    }
    
    func posicionarRadicadoLabel() {
        radicadoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            radicadoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            radicadoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    
    func posicionarIdLabel() {
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            idLabel.topAnchor.constraint(equalTo: radicadoLabel.bottomAnchor, constant: 8),
            idLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configurarCeldaCon(proceso: ProcesoDominio) {
        self.proceso = proceso
        asignarRadicadoAlProceso(proceso.radicado)
        asignarIdAlProceso(proceso.id)
    }
}

extension ProcesoTableViewCell: ProcesoTableViewCellProtocol {
    func asignarRadicadoAlProceso(_ radicado: String) {
        radicadoLabel.text = "Radicado: \(radicado)"
    }
    
    func asignarIdAlProceso(_ Id: String) {
        idLabel.text = "ID: \(Id)"
    }
}
