package com.yourapp

class Entrada {


	Bar bar 
	Proveedor proveedor
	int cantidad
	String etiquetaVino
	double precioUnitario
	Double precioVenta
	Double precioCompra

	static hasMany = [cervezas:Cerveza, 
					  vinos:Vino, 
					  refrescos:Refresco]
					  

	

    static constraints = {

    	
    }
}
