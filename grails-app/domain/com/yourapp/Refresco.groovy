package com.yourapp

class Refresco {

	String nombre
	int cantidad


	static belongsTo = [ventas:Venta,
						almacen:Almacen]

    static constraints = {
    }
}
