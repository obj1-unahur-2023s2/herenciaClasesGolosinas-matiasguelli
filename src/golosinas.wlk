/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


class Golosina{
	var peso 
	method peso() = peso
}

class Bombon inherits Golosina{
	
	
	method precio() { return 5 }
	override method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() { return frutilla }
	method libreGluten() { return true }
}


class Alfajor inherits Golosina{
	
	method precio() { return 12 }
	override method peso() { return peso }
	method mordisco() { peso = peso * 0.8 }
	method sabor() { return chocolate }
	method libreGluten() { return false }
}

class Caramelo inherits Golosina{
	var property sabor 
	
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso - 1 }
	method libreGluten() { return true }
}


class Chupetin inherits Golosina{
	
	method precio() { return 2 }
	override method peso() { return peso }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() { return naranja }
	method libreGluten() { return true }
}

class Oblea inherits Golosina{
	
	method precio() { return 5 }
	override method peso() { return peso }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	method sabor() { return vainilla }
	method libreGluten() { return false }
}

class Chocolatin inherits Golosina{
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var comido = 0
	
	method pesoInicial(unPeso) { peso = unPeso }
	method precio() { return peso * 0.50 }
	override method peso() { return (peso - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}

class GolosinaBaniada inherits Golosina{
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	override method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti inherits Golosina{
	var libreDeGluten
	var sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	override method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}

class BombonDuro inherits Bombon {
	override method mordisco(){
		peso = 0.max(peso -1)
	}
	method gradoDeDureza(){
		if (peso > 12){
			return 3
		}
		else if(peso.betwenn(8,13)){
			return 2
		}
		else return 1
	}
}

class CarameloRelleno inherits Caramelo{
	override method mordisco(){
		super()
		sabor = chocolate
	}
	override method precio() = super()+1
}

class ObleasCrujientes inherits Oblea{
	var cantidadMordiscos = 0 
	override method mordisco() {
		if (cantidadMordiscos <= 3){
			if (peso >= 70) {
				// el peso pasa a ser la mitad
				peso = peso * 0.5 + 3
				cantidadMordiscos ++
			} else { 
				// pierde el 25% del peso
				peso = peso - (peso * 0.25) + 3
				cantidadMordiscos ++
		}
		}
		else {
			if (peso >= 70) {
			// el peso pasa a ser la mitad
				peso = peso * 0.5
				cantidadMordiscos ++
			} else { 
			// pierde el 25% del peso
				peso = peso - (peso * 0.25)
				cantidadMordiscos ++
			}
		}
	}	
	method Debil() = cantidadMordiscos > 3
	
}

