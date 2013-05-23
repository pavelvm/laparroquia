package com.yourapp

class Proveedor {

	String nombre
	String status
	String descripcion
	

    static constraints = {

    	status blank:false, inList: ["Pagado", "Adeuda"]
    }
}
