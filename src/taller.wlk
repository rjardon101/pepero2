class Costurero {
	method puedeTrabajarSobre(uniforme) = uniforme.soportaCosturasExtra()	
	method pasoUniforme(uniforme) { uniforme.agregarCosturaExtra() }
}

class Bordador { 
	var _puedeSacarLeyenda
	
	method puedeTrabajarSobre(uniforme) = _puedeSacarLeyenda or !uniforme.tieneLeyenda()	
	method pasoUniforme(uniforme) { 
		uniforme.ponerLeyenda(uniforme.cliente().nombreEmpresa())
	}
}

class CentroDeProcesamiento {
	
	var talleres = #{}
	var uniformes = #{}
	
	method clientesDelCentro() {
		return uniformes.map({uniforme => uniforme.cliente()}).asSet()
	}
	
	
	method uniformeListo(_unUniforme) {
		return _unUniforme.cliente().aceptaResistencia(_unUniforme) and _unUniforme.cliente().aceptaColor(_unUniforme) and _unUniforme.cliente().aceptaLeyenda(_unUniforme)
	}
	
	method uniformeListosParaClientes() {
		return uniformes.filter({uniforme => self.uniformeListo(uniforme)})
	} 
	
	method clienteQueVanARecibir() {
		return self.uniformeListosParaClientes().map({uniforme => uniforme.cliente()}) 
	}
}