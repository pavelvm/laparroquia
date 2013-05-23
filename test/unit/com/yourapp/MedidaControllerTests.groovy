package com.yourapp



import org.junit.*
import grails.test.mixin.*

@TestFor(MedidaController)
@Mock(Medida)
class MedidaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medida/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medidaInstanceList.size() == 0
        assert model.medidaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medidaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medidaInstance != null
        assert view == '/medida/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medida/show/1'
        assert controller.flash.message != null
        assert Medida.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medida/list'

        populateValidParams(params)
        def medida = new Medida(params)

        assert medida.save() != null

        params.id = medida.id

        def model = controller.show()

        assert model.medidaInstance == medida
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medida/list'

        populateValidParams(params)
        def medida = new Medida(params)

        assert medida.save() != null

        params.id = medida.id

        def model = controller.edit()

        assert model.medidaInstance == medida
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medida/list'

        response.reset()

        populateValidParams(params)
        def medida = new Medida(params)

        assert medida.save() != null

        // test invalid parameters in update
        params.id = medida.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medida/edit"
        assert model.medidaInstance != null

        medida.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medida/show/$medida.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medida.clearErrors()

        populateValidParams(params)
        params.id = medida.id
        params.version = -1
        controller.update()

        assert view == "/medida/edit"
        assert model.medidaInstance != null
        assert model.medidaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medida/list'

        response.reset()

        populateValidParams(params)
        def medida = new Medida(params)

        assert medida.save() != null
        assert Medida.count() == 1

        params.id = medida.id

        controller.delete()

        assert Medida.count() == 0
        assert Medida.get(medida.id) == null
        assert response.redirectedUrl == '/medida/list'
    }
}
