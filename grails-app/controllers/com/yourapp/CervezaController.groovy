package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class CervezaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cervezaInstanceList: Cerveza.list(params), cervezaInstanceTotal: Cerveza.count()]
    }

    def create() {
        [cervezaInstance: new Cerveza(params)]
    }

    def save() {
        def cervezaInstance = new Cerveza(params)
        if (!cervezaInstance.save(flush: true)) {
            render(view: "create", model: [cervezaInstance: cervezaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), cervezaInstance.id])
        redirect(action: "show", id: cervezaInstance.id)
    }

    def show(Long id) {
        def cervezaInstance = Cerveza.get(id)
        if (!cervezaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "list")
            return
        }

        [cervezaInstance: cervezaInstance]
    }

    def edit(Long id) {
        def cervezaInstance = Cerveza.get(id)
        if (!cervezaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "list")
            return
        }

        [cervezaInstance: cervezaInstance]
    }

    def update(Long id, Long version) {
        def cervezaInstance = Cerveza.get(id)
        if (!cervezaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cervezaInstance.version > version) {
                cervezaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cerveza.label', default: 'Cerveza')] as Object[],
                          "Another user has updated this Cerveza while you were editing")
                render(view: "edit", model: [cervezaInstance: cervezaInstance])
                return
            }
        }

        cervezaInstance.properties = params

        if (!cervezaInstance.save(flush: true)) {
            render(view: "edit", model: [cervezaInstance: cervezaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), cervezaInstance.id])
        redirect(action: "show", id: cervezaInstance.id)
    }

    def delete(Long id) {
        def cervezaInstance = Cerveza.get(id)
        if (!cervezaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "list")
            return
        }

        try {
            cervezaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cerveza.label', default: 'Cerveza'), id])
            redirect(action: "show", id: id)
        }
    }
}
