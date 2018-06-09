import color.*

class Material {
	var _gradoResistencia = 0
	var _maximoCosturasExtra = 0
	
	method gradoResistencia() = _gradoResistencia
	method maximoCosturasExtra() = _maximoCosturasExtra
}


class Uniforme {
	var _cantRefuerzos = 0
	var _cantCosturasExtra = 0
	var _material
	var _leyenda = ""
	var _color = colorNegro
	var _cliente 
	
	method material() = _material
	method setMaterial(mat) { _material = mat }
	method cantRefuerzos() = _cantRefuerzos
	method cantCosturasExtra() = _cantCosturasExtra
	method leyenda() = _leyenda
	method tieneLeyenda() = _leyenda.size() > 0
	method color() = _color
	method cliente() = _cliente
	
	method maximoCosturasExtra() = self.material().maximoCosturasExtra()
	
	method soportaCosturasExtra() = self.cantCosturasExtra() < self.maximoCosturasExtra()

	method resistencia() = 
		(self.material().gradoResistencia() + (self.cantRefuerzos() / 2)) 
		* (1 + (self.cantCosturasExtra() / 5))
	method valor() = self.cliente().valorUniforme()		
		
	method ponerLeyenda(texto) { _leyenda = texto }
	method agregarCosturaExtra() { _cantCosturasExtra += 1 }
}