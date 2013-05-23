package com.yourapp

import org.springframework.dao.DataIntegrityViolationException

class BarrilController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [barrilInstanceList: Barril.list(params), barrilInstanceTotal: Barril.count()]
    }

    def create() {
        [barrilInstance: new Barril(params)]
    }

    def save() {
        def barrilInstance = new Barril(params)
        if (!barrilInstance.save(flush: true)) {
            render(view: "create", model: [barrilInstance: barrilInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'barril.label', default: 'Barril'), barrilInstance.id])
        redirect(action: "show", id: barrilInstance.id)
    }

    def show(Long id) {
        def barrilInstance = Barril.get(id)
        if (!barrilInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "list")
            return
        }

        [barrilInstance: barrilInstance]
    }

    def edit(Long id) {
        def barrilInstance = Barril.get(id)
        if (!barrilInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "list")
            return
        }

        [barrilInstance: barrilInstance]
    }

    def update(Long id, Long version) {
        def barrilInstance = Barril.get(id)
        if (!barrilInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (barrilInstance.version > version) {
                barrilInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'barril.label', default: 'Barril')] as Object[],
                          "Another user has updated this Barril while you were editing")
                render(view: "edit", model: [barrilInstance: barrilInstance])
                return
            }
        }

        barrilInstance.properties = params

        if (!barrilInstance.save(flush: true)) {
            render(view: "edit", model: [barrilInstance: barrilInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'barril.label', default: 'Barril'), barrilInstance.id])
        redirect(action: "show", id: barrilInstance.id)
    }

    def delete(Long id) {
        def barrilInstance = Barril.get(id)
        if (!barrilInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "list")
            return
        }

        try {
            barrilInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'barril.label', default: 'Barril'), id])
            redirect(action: "show", id: id)
        }
    }
}
