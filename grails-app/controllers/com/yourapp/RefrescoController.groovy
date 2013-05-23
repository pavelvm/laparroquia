package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class RefrescoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [refrescoInstanceList: Refresco.list(params), refrescoInstanceTotal: Refresco.count()]
    }

    def create() {
        [refrescoInstance: new Refresco(params)]
    }

    def save() {
        def refrescoInstance = new Refresco(params)
        if (!refrescoInstance.save(flush: true)) {
            render(view: "create", model: [refrescoInstance: refrescoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'refresco.label', default: 'Refresco'), refrescoInstance.id])
        redirect(action: "show", id: refrescoInstance.id)
    }

    def show(Long id) {
        def refrescoInstance = Refresco.get(id)
        if (!refrescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "list")
            return
        }

        [refrescoInstance: refrescoInstance]
    }

    def edit(Long id) {
        def refrescoInstance = Refresco.get(id)
        if (!refrescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "list")
            return
        }

        [refrescoInstance: refrescoInstance]
    }

    def update(Long id, Long version) {
        def refrescoInstance = Refresco.get(id)
        if (!refrescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (refrescoInstance.version > version) {
                refrescoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'refresco.label', default: 'Refresco')] as Object[],
                          "Another user has updated this Refresco while you were editing")
                render(view: "edit", model: [refrescoInstance: refrescoInstance])
                return
            }
        }

        refrescoInstance.properties = params

        if (!refrescoInstance.save(flush: true)) {
            render(view: "edit", model: [refrescoInstance: refrescoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'refresco.label', default: 'Refresco'), refrescoInstance.id])
        redirect(action: "show", id: refrescoInstance.id)
    }

    def delete(Long id) {
        def refrescoInstance = Refresco.get(id)
        if (!refrescoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "list")
            return
        }

        try {
            refrescoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'refresco.label', default: 'Refresco'), id])
            redirect(action: "show", id: id)
        }
    }
}
