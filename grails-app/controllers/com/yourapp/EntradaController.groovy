package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class EntradaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entradaInstanceList: Entrada.list(params), entradaInstanceTotal: Entrada.count()]
    }

    def create() {
        [entradaInstance: new Entrada(params)]
    }

    def save() {
        def entradaInstance = new Entrada(params)
        if (!entradaInstance.save(flush: true)) {
            render(view: "create", model: [entradaInstance: entradaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entrada.label', default: 'Entrada'), entradaInstance.id])
        redirect(action: "show", id: entradaInstance.id)
    }

    def show(Long id) {
        def entradaInstance = Entrada.get(id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "list")
            return
        }

        [entradaInstance: entradaInstance]
    }

    def edit(Long id) {
        def entradaInstance = Entrada.get(id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "list")
            return
        }

        [entradaInstance: entradaInstance]
    }

    def update(Long id, Long version) {
        def entradaInstance = Entrada.get(id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entradaInstance.version > version) {
                entradaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entrada.label', default: 'Entrada')] as Object[],
                          "Another user has updated this Entrada while you were editing")
                render(view: "edit", model: [entradaInstance: entradaInstance])
                return
            }
        }

        entradaInstance.properties = params

        if (!entradaInstance.save(flush: true)) {
            render(view: "edit", model: [entradaInstance: entradaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entrada.label', default: 'Entrada'), entradaInstance.id])
        redirect(action: "show", id: entradaInstance.id)
    }

    def delete(Long id) {
        def entradaInstance = Entrada.get(id)
        if (!entradaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "list")
            return
        }

        try {
            entradaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entrada.label', default: 'Entrada'), id])
            redirect(action: "show", id: id)
        }
    }
}
