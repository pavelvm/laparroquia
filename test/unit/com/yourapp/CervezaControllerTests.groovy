package com.yourapp



import org.junit.*
import grails.test.mixin.*

@TestFor(CervezaController)
@Mock(Cerveza)
class CervezaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cerveza/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cervezaInstanceList.size() == 0
        assert model.cervezaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cervezaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cervezaInstance != null
        assert view == '/cerveza/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cerveza/show/1'
        assert controller.flash.message != null
        assert Cerveza.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cerveza/list'

        populateValidParams(params)
        def cerveza = new Cerveza(params)

        assert cerveza.save() != null

        params.id = cerveza.id

        def model = controller.show()

        assert model.cervezaInstance == cerveza
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cerveza/list'

        populateValidParams(params)
        def cerveza = new Cerveza(params)

        assert cerveza.save() != null

        params.id = cerveza.id

        def model = controller.edit()

        assert model.cervezaInstance == cerveza
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cerveza/list'

        response.reset()

        populateValidParams(params)
        def cerveza = new Cerveza(params)

        assert cerveza.save() != null

        // test invalid parameters in update
        params.id = cerveza.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cerveza/edit"
        assert model.cervezaInstance != null

        cerveza.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cerveza/show/$cerveza.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cerveza.clearErrors()

        populateValidParams(params)
        params.id = cerveza.id
        params.version = -1
        controller.update()

        assert view == "/cerveza/edit"
        assert model.cervezaInstance != null
        assert model.cervezaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cerveza/list'

        response.reset()

        populateValidParams(params)
        def cerveza = new Cerveza(params)

        assert cerveza.save() != null
        assert Cerveza.count() == 1

        params.id = cerveza.id

        controller.delete()

        assert Cerveza.count() == 0
        assert Cerveza.get(cerveza.id) == null
        assert response.redirectedUrl == '/cerveza/list'
    }
}
