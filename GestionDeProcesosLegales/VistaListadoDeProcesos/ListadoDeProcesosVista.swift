//
//  ListadoDeProcesosVista.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 29/03/23.
//

import UIKit

protocol JefeListadoDeProcesosVista: AnyObject {
    func procesarToqueBotonAgregar()
    func procesarToqueBotonActualizar()
    func procesarToqueBotonEditar()
}

protocol ListadoDeProcesosVistaProtocol where Self: UIView {
    func asignarJefe(_ jefe: JefeListadoDeProcesosVista)
    func actualizarTabla()
}

class ListadoDeProcesosVista: UIView {
    
    let tableView = UITableView()
    
    private struct Constantes {
        static let ideintificadorCelda = "procesoCell"
    }
    
    weak var viewController: UIViewController?
    private weak var miJefe: JefeListadoDeProcesosVista?
    private let cerebro: ListadoDeProcesosCerebroProtocol = ListadoDeProcesosCerebro()
    private let comandoAgregarProceso: ComandoAgregarProcesoProtocol = ComandoAgregarProceso()
    private let comandoEliminarProceso: ComandoEliminarProcesoProtocol = ComandoEliminarProceso()
    private let botonAgregar = ListadoDeProcesosBotonAgregar()
    private let botonActualizar = ListadoDeProcesosBotonActualizar()
    private let tituloListado = ListadoLabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configurarTableView()
        configurarVistaPrincipal()
        cerebro.asignarListadoDeProcesosVista(self)
        botonAgregar.asignarJefe(self)
        botonActualizar.asignarJefe(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func configurarTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configurarVistaPrincipal() {
        agregarElementosALaVista()
        personalizarInterfazDeUsuario()
        posicionarElementosEnPantalla()
    }
    
    func agregarElementosALaVista() {
        addSubview(botonAgregar)
        addSubview(botonActualizar)
        addSubview(tituloListado)
        addSubview(tableView)
    }
    
    func personalizarInterfazDeUsuario(){
        agregarColorAlaVista()
        personalizarTabla()
    }
    
    func agregarColorAlaVista() {
        backgroundColor = .gray
    }
    
    func personalizarTabla() {
        tableView.backgroundColor = .cyan
        tableView.separatorStyle = .none
        tableView.register(ProcesoTableViewCell.self, forCellReuseIdentifier: Constantes.ideintificadorCelda )
    }
    
    func posicionarElementosEnPantalla() {
        posicionarBotonAgregar()
        posicionarBotonActualizar()
        posicionarTitulo()
        posicionarTabla()
    }
    
    func posicionarBotonAgregar() {
        botonAgregar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botonAgregar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            botonAgregar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
    
    func posicionarBotonActualizar() {
        botonActualizar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botonActualizar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            botonActualizar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
    }
    
    func posicionarTitulo() {
        tituloListado.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tituloListado.centerXAnchor.constraint(equalTo: centerXAnchor),
            tituloListado.centerYAnchor.constraint(equalTo: botonAgregar.centerYAnchor)
        ])
    }
    
    func posicionarTabla() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: botonAgregar.bottomAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func actualizarTabla() {
        tableView.reloadData()
    }
    
    func agregarProcesoALaTabla(proceso: ProcesoDominio) {
        cerebro.agregarProceso(proceso)
        actualizarTabla()
    }
    
    func mostrarPantallaDeEdicionParaProceso(_ proceso: ProcesoDominio, finalizarEdicion: @escaping (ProcesoDominio) -> Void) {
        botonEditarPresionado()
    }
}

extension ListadoDeProcesosVista: ListadoDeProcesosVistaProtocol {
    func asignarJefe(_ jefe: JefeListadoDeProcesosVista) {
        miJefe = jefe
    }
    
    func botonEditarPresionado() {
        guard let miJefe = miJefe else {
            return
        }
        miJefe.procesarToqueBotonEditar()
    }
}

extension ListadoDeProcesosVista: ListadoDeProcesosBotonAgregarProtocol {
    func botonAgregarPresionado() {
        guard let miJefe = miJefe else {
            return
        }
        miJefe.procesarToqueBotonAgregar()
        let nuevoProceso = ProcesoDominio(id: "1234" , tipoDeProceso: "Demanda Prueba", estadoDelProceso: "56", juezACargo: "78", fechaInicioProceso: "9", demandado: "12", radicado: "123456789")
        comandoAgregarProceso.agregarProceso(nuevoProceso)
        agregarProcesoALaTabla(proceso: nuevoProceso)
    }
}

extension ListadoDeProcesosVista: ListadoDeProcesosBotonActualizarProtocol {
    func botonActualizarPresionado() {
        guard let miJefe = miJefe else {
            return
        }
        miJefe.procesarToqueBotonActualizar()
        actualizarTabla()
    }
}

extension ListadoDeProcesosVista: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cerebro.obtenerNumeroDeProcesos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constantes.ideintificadorCelda, for: indexPath) as! ProcesoTableViewCellProtocol
        let proceso = cerebro.obtenerProceso(de: indexPath.row)
        cell.asignarRadicadoAlProceso(proceso.radicado)
        cell.asignarTipoDeProcesoAlProceso(proceso.tipoDeProceso)
        return cell as UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let proceso = cerebro.obtenerProceso(de: indexPath.row)
            comandoEliminarProceso.eliminarProceso(proceso: proceso)
            cerebro.eliminarProceso(en: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editarAccion = UIContextualAction(style: .normal, title: "Editar") { _, _, _ in
            let proceso = self.cerebro.obtenerProceso(de: indexPath.row)
            self.mostrarPantallaDeEdicionParaProceso(proceso) { procesoActualizado in
                self.cerebro.actualizarProceso(proceso: procesoActualizado, en: indexPath.row)
                self.actualizarTabla()
            }
        }
        editarAccion.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [editarAccion])
    }
}


