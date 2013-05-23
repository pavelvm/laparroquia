package com.yourapp

class Venta {

	String nombreCliente
	Date fechaVenta
	Double totalCuenta
	String status
	String descipcion
	

	static hasMany = [cervezas:Cerveza, 
					  vinos:Vino, 
					  refrescos:Refresco]

    static constraints = {

    	nombreCliente blank:false
    	status blank:false, inList: ["Pagado", "Adeuda"]
    	totalCuenta blank:false
    	fechaVenta nullable:false
    }

    String toString(){
        return "total: ${totalCuenta} "
    }
}
