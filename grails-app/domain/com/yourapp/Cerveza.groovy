package com.yourapp

class Cerveza {

	String nombre
	int medida
	int cantidad

	static belongsTo = [ventas:Venta,
						almacen:Almacen]

    static constraints = {
    }

    String toString(){
    	return "esta es la cerveza ${nombre}"
    }
}
