package com.yourapp

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class VentaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ventaInstanceList: Venta.list(params), ventaInstanceTotal: Venta.count()]
    }

    def create() {
        [ventaInstance: new Venta(params)]
    }

    def save() {
        println params 


        def ventaInstance = new Venta(params)
        if (!ventaInstance.save(flush: true)) {
            render(view: "create", model: [ventaInstance: ventaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'venta.label', default: 'Venta'), ventaInstance.id])
        redirect(action: "show", id: ventaInstance.id)
    }

    def guardarNombre(){
        println params 
        def ventaInstance = new Venta()
        ventaInstance.nombreCliente=params.nombreCliente
        ventaInstance.fechaVenta=new Date()
        ventaInstance.totalCuenta=0
        ventaInstance.status="Pagado"
        ventaInstance.descipcion="hola"
        ventaInstance.save(flush:true, failOnError:true)

        def totalventas=Venta.findAll()
        println "+++++++++++++++"+ totalventas.size()
            
        

    }



    def show(Long id) {
        def ventaInstance = Venta.get(id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "list")
            return
        }

        [ventaInstance: ventaInstance]
    }

    def edit(Long id) {
        def ventaInstance = Venta.get(id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "list")
            return
        }

        [ventaInstance: ventaInstance]
    }

    def update(Long id, Long version) {
        def ventaInstance = Venta.get(id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ventaInstance.version > version) {
                ventaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'venta.label', default: 'Venta')] as Object[],
                          "Another user has updated this Venta while you were editing")
                render(view: "edit", model: [ventaInstance: ventaInstance])
                return
            }
        }

        ventaInstance.properties = params

        if (!ventaInstance.save(flush: true)) {
            render(view: "edit", model: [ventaInstance: ventaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'venta.label', default: 'Venta'), ventaInstance.id])
        redirect(action: "show", id: ventaInstance.id)
    }

    def delete(Long id) {
        def ventaInstance = Venta.get(id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "list")
            return
        }

        try {
            ventaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'venta.label', default: 'Venta'), id])
            redirect(action: "show", id: id)
        }
    }
}
