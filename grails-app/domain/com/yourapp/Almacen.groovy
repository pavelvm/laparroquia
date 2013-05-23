package com.yourapp

class Almacen {

	static hasMany = [entradas:Entrada]
	static belongsTo =[bar:Bar]
	
	String nombreAlmacen

	
    static constraints = {
    }

    String toString(){
    	return "${nombreAlmacen} - ${bar} "
    }
}
