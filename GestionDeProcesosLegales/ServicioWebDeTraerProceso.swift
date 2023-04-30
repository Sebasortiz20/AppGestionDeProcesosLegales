//
//  ServicioWebDeTraerProceso.swift
//  GestionDeProcesosLegales
//
//  Created by sebas  on 24/04/23.
//

import Foundation

protocol ServicioWebDeTraerProcesoProtocol {
    func obtenerProcesos(casoExito: @escaping ([ProcesoDominio]) -> (), casoError: @escaping (ErrorDeServicioWeb) -> ())
    func asignarRadicado(numeroRadicado: String)
}

enum ErrorDeServicioWeb: Error {
    case noSePudoHacerLaPeticion
    case códigoDeEstadoInesperado
    case datosNulosInesperados
    case errorDeDescodificación
}

class ServicioWebDeTraerProceso {
    private var numeroRadicado: String = ""
}

extension ServicioWebDeTraerProceso: ServicioWebDeTraerProcesoProtocol {
    
    func asignarRadicado(numeroRadicado: String) {
        self.numeroRadicado = numeroRadicado
    }
    
    func obtenerProcesos(casoExito: @escaping ([ProcesoDominio]) -> (), casoError: @escaping (ErrorDeServicioWeb) -> ()) { /// se hace el llamado al servidor web                     ////  clase servicios web
        let configuracion = URLSessionConfiguration.default
        let session = URLSession(configuration: configuracion)
        
        let solicitud = obtenerSolicitud()
        
        let tarea = session.dataTask(with: solicitud) {[weak self] data, respuesta, error in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.procesarRespuesta(data: data, respuesta: respuesta, error: error, casoExito: casoExito, casoError: casoError)
            }
        }
        tarea.resume()
    }
    
    func procesarRespuesta(data: Data?, respuesta: URLResponse?, error: Error?, casoExito: ([ProcesoDominio]) -> (), casoError: (ErrorDeServicioWeb) -> ()) {
        if let error  = error {
            print("Ocurrio un error extraordinario en la peticion: " + error.localizedDescription)
            casoError(.noSePudoHacerLaPeticion)
            return
        }
        if let respuesta = respuesta as? HTTPURLResponse, respuesta.statusCode != 200 {
            print("Obtuve algun error en la respuesta obtenida")
            casoError(.códigoDeEstadoInesperado)
            return
        }
        guard let data = data else {
            print("Se esperaba que los datos fueran distintos de nulo")
            casoError(.datosNulosInesperados)
            return
        }
        do {
            let respuestaRadicado = try JSONDecoder().decode(Radicado.self, from: data)
            let respuestaConvertida = MapaAPIProcesoAProcesoDominio.convertir(respuestaRadicado)
            casoExito(respuestaConvertida)
        } catch {
            print("Hubo un error decodificando la respuesta")
            casoError(.errorDeDescodificación)
        }
    }
    
    func obtenerSolicitud() -> URLRequest {
        let urlString = "https://consultaprocesos.ramajudicial.gov.co:448/api/v2/Procesos/Consulta/NumeroRadicacion?numero=\(self.numeroRadicado)&SoloActivos=false&pagina=1"
        print(urlString)
        guard let url = URL(string: urlString) else {
            print("la URl no es valida")
            fatalError("La URL no es válida")
        }
        var solicitud = URLRequest(url: url)
        solicitud.httpMethod = "GET"
        return solicitud
    }
 }
