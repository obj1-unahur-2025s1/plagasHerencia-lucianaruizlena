class Barrio {
    const elementosDelBarrio = []

    method agregarElemento(elemento) {
        elementosDelBarrio.add(elemento)      
    }

    method eliminarElemento(elemento) {
        elementosDelBarrio.remove(elemento)      
    }

    method esCopado() = elementosDelBarrio.filter({e => e.esBueno()}).size() > elementosDelBarrio.filter({e => not e.esBueno()}).size()
}

class Elemento {
    method esBueno()
}

class Hogar inherits Elemento {
    var nivelDeMuegre
    var nivelDeConfort

    override method esBueno() = nivelDeMuegre * 2 <= nivelDeConfort 

    method ataqueDe(plaga) {
        nivelDeMuegre = nivelDeMuegre + plaga.nivelDeDanio()
    }
}

class Huerta inherits Elemento {
    var capacidadDeProduccion

    override method esBueno() = capacidadDeProduccion > valorDeLasHuerta

    method ataqueDe(plaga) {
        capacidadDeProduccion = if(plaga.transmiteEnfermedades()){(capacidadDeProduccion/0.10)- 10} else {capacidadDeProduccion*0.10}
    }
}

object valorDeLasHuerta {
    method valor() = 0
}

class Mascota inherits Elemento {
    var nivelDeSalud
    override method esBueno() = nivelDeSalud > 250

    method ataqueDe(plaga) {
        nivelDeSalud = if (plaga.transmiteEnfermedades()){nivelDeSalud - plaga.nivelDeDanio()}
    }
}

/*------------------------------------------------------------------*/

class Plagas {
    var property poblacion
    const property nivelDeDanio

    method transmiteEnfermedades() = poblacion >= 10

    method efectoDeAtaque() {
        poblacion = poblacion * 0.10
    }
}

class Cucarachas inherits Plagas {
    var property peso
    override method nivelDeDanio() = poblacion / 2
    override method transmiteEnfermedades() = super() && peso >= 10

    override method efectoDeAtaque() {
        super() && peso + 2
    }
}

class Pulgas inherits Plagas {
    override method nivelDeDanio() = poblacion * 2
}

class Garrapatas inherits Plagas {
    override method nivelDeDanio() = poblacion * 2

    override method efectoDeAtaque() {
        poblacion = poblacion * 0.20
    }
}

class Mosquitos inherits Plagas {
    override method nivelDeDanio() = poblacion
    override method transmiteEnfermedades() = super() && poblacion % 3 == 0
}