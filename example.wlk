
class Hogar {
  var nivelDeMugre
  const nivelDeConfort 

  method esBueno() = nivelDeMugre * 2 <= nivelDeConfort 
}

class Huerta{
  var property capacidadDeProduccion 
  method esBueno() = capacidadDeProduccion > valorDeLaHuerta
}

object valorDeLaHuerta {
  var property valor = 10  
}

class Mascota {
  var nivelDeSalud
  method esBueno() = nivelDeSalud > 250 
}



//--------------------------

class Plagas {
  var poblacion
  method transmiteEnfermedades() = poblacion >= 10

}

class Cucharachas inherits Plagas {
  var property peso
  method pesoPromedio() = peso / poblacion 
  method nivelDeDaño() = poblacion / 2
  override method transmiteEnfermedades() = self.transmiteEnfermedades() && self.pesoPromedio() >= 10

}

class Pulgas inherits Plagas {
  method nivelDeDaño() = poblacion * 2
}

class Garrapatas inherits Plagas {
  method nivelDeDaño() = poblacion * 2
}

class Mosquitos inherits Plagas {
  method nivelDeDaño() = poblacion 
  override method transmiteEnfermedades() = self.transmiteEnfermedades() && poblacion % 3 == 0
}