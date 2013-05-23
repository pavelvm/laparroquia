package com.yourapp

class Vino {

	String nombre
	String etiquetaVino
	int cantidad
	

	Medida medida 

	static belongsTo = [ventas:Venta,
						almacen:Almacen]

    static constraints = {
    }
}
