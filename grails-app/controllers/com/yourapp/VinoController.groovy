package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class VinoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [vinoInstanceList: Vino.list(params), vinoInstanceTotal: Vino.count()]
    }

    def create() {
        [vinoInstance: new Vino(params)]
    }

    def save() {
        def vinoInstance = new Vino(params)
        if (!vinoInstance.save(flush: true)) {
            render(view: "create", model: [vinoInstance: vinoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'vino.label', default: 'Vino'), vinoInstance.id])
        redirect(action: "show", id: vinoInstance.id)
    }

    def show(Long id) {
        def vinoInstance = Vino.get(id)
        if (!vinoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "list")
            return
        }

        [vinoInstance: vinoInstance]
    }

    def edit(Long id) {
        def vinoInstance = Vino.get(id)
        if (!vinoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "list")
            return
        }

        [vinoInstance: vinoInstance]
    }

    def update(Long id, Long version) {
        def vinoInstance = Vino.get(id)
        if (!vinoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (vinoInstance.version > version) {
                vinoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'vino.label', default: 'Vino')] as Object[],
                          "Another user has updated this Vino while you were editing")
                render(view: "edit", model: [vinoInstance: vinoInstance])
                return
            }
        }

        vinoInstance.properties = params

        if (!vinoInstance.save(flush: true)) {
            render(view: "edit", model: [vinoInstance: vinoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'vino.label', default: 'Vino'), vinoInstance.id])
        redirect(action: "show", id: vinoInstance.id)
    }

    def delete(Long id) {
        def vinoInstance = Vino.get(id)
        if (!vinoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "list")
            return
        }

        try {
            vinoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'vino.label', default: 'Vino'), id])
            redirect(action: "show", id: id)
        }
    }
}
