package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class MedidaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [medidaInstanceList: Medida.list(params), medidaInstanceTotal: Medida.count()]
    }

    def create() {
        [medidaInstance: new Medida(params)]
    }

    def save() {
        def medidaInstance = new Medida(params)
        if (!medidaInstance.save(flush: true)) {
            render(view: "create", model: [medidaInstance: medidaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'medida.label', default: 'Medida'), medidaInstance.id])
        redirect(action: "show", id: medidaInstance.id)
    }

    def show(Long id) {
        def medidaInstance = Medida.get(id)
        if (!medidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "list")
            return
        }

        [medidaInstance: medidaInstance]
    }

    def edit(Long id) {
        def medidaInstance = Medida.get(id)
        if (!medidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "list")
            return
        }

        [medidaInstance: medidaInstance]
    }

    def update(Long id, Long version) {
        def medidaInstance = Medida.get(id)
        if (!medidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (medidaInstance.version > version) {
                medidaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'medida.label', default: 'Medida')] as Object[],
                          "Another user has updated this Medida while you were editing")
                render(view: "edit", model: [medidaInstance: medidaInstance])
                return
            }
        }

        medidaInstance.properties = params

        if (!medidaInstance.save(flush: true)) {
            render(view: "edit", model: [medidaInstance: medidaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'medida.label', default: 'Medida'), medidaInstance.id])
        redirect(action: "show", id: medidaInstance.id)
    }

    def delete(Long id) {
        def medidaInstance = Medida.get(id)
        if (!medidaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "list")
            return
        }

        try {
            medidaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'medida.label', default: 'Medida'), id])
            redirect(action: "show", id: id)
        }
    }
}
