package com.yourapp

class Producto {


	String nombreProducto
	String descripcion
	String tipoProducto
	int cantidad

	static hasMany = [entradas:Entrada]

    static constraints = {
    }
}
