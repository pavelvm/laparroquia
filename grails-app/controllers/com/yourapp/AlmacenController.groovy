package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class AlmacenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [almacenInstanceList: Almacen.list(params), almacenInstanceTotal: Almacen.count()]
    }

    def create() {
        [almacenInstance: new Almacen(params)]
    }

    def save() {
        def almacenInstance = new Almacen(params)
        if (!almacenInstance.save(flush: true)) {
            render(view: "create", model: [almacenInstance: almacenInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacenInstance.id])
        redirect(action: "show", id: almacenInstance.id)
    }

    def show(Long id) {
        def almacenInstance = Almacen.get(id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        [almacenInstance: almacenInstance]
    }

    def edit(Long id) {
        def almacenInstance = Almacen.get(id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        [almacenInstance: almacenInstance]
    }

    def update(Long id, Long version) {
        def almacenInstance = Almacen.get(id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (almacenInstance.version > version) {
                almacenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'almacen.label', default: 'Almacen')] as Object[],
                          "Another user has updated this Almacen while you were editing")
                render(view: "edit", model: [almacenInstance: almacenInstance])
                return
            }
        }

        almacenInstance.properties = params

        if (!almacenInstance.save(flush: true)) {
            render(view: "edit", model: [almacenInstance: almacenInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'almacen.label', default: 'Almacen'), almacenInstance.id])
        redirect(action: "show", id: almacenInstance.id)
    }

    def delete(Long id) {
        def almacenInstance = Almacen.get(id)
        if (!almacenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
            return
        }

        try {
            almacenInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'almacen.label', default: 'Almacen'), id])
            redirect(action: "show", id: id)
        }
    }
}
