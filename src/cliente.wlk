import color.*

class Cliente {
	var _nombreEmpresa
	var _valorUniforme
	var _uniformesRecibidos = []

	method nombreEmpresa() = _nombreEmpresa
	method valorUniforme() = _valorUniforme
		
	method aceptaLeyenda(uniforme) = uniforme.leyenda() == _nombreEmpresa
	
	method valorTotalUniformesRecibidos() = _uniformesRecibidos.sum({unif => unif.valor()}) 
}

class Deposito inherits Cliente {
	method aceptaColor(uniforme) = [colorNegro, colorMarron, colorAzul].contains(uniforme.color())
	method aceptaResistencia(uniforme) = uniforme.resistencia() > 7
}

class Fabrica inherits Cliente {
	var _umbralResistencia
	
	method aceptaColor(uniforme) = true
	method aceptaResistencia(uniforme) = uniforme.resistencia() > _umbralResistencia
}
