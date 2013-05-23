package com.yourapp



import org.junit.*
import grails.test.mixin.*

@TestFor(VinoController)
@Mock(Vino)
class VinoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vino/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vinoInstanceList.size() == 0
        assert model.vinoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vinoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vinoInstance != null
        assert view == '/vino/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vino/show/1'
        assert controller.flash.message != null
        assert Vino.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vino/list'

        populateValidParams(params)
        def vino = new Vino(params)

        assert vino.save() != null

        params.id = vino.id

        def model = controller.show()

        assert model.vinoInstance == vino
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vino/list'

        populateValidParams(params)
        def vino = new Vino(params)

        assert vino.save() != null

        params.id = vino.id

        def model = controller.edit()

        assert model.vinoInstance == vino
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vino/list'

        response.reset()

        populateValidParams(params)
        def vino = new Vino(params)

        assert vino.save() != null

        // test invalid parameters in update
        params.id = vino.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vino/edit"
        assert model.vinoInstance != null

        vino.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vino/show/$vino.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vino.clearErrors()

        populateValidParams(params)
        params.id = vino.id
        params.version = -1
        controller.update()

        assert view == "/vino/edit"
        assert model.vinoInstance != null
        assert model.vinoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vino/list'

        response.reset()

        populateValidParams(params)
        def vino = new Vino(params)

        assert vino.save() != null
        assert Vino.count() == 1

        params.id = vino.id

        controller.delete()

        assert Vino.count() == 0
        assert Vino.get(vino.id) == null
        assert response.redirectedUrl == '/vino/list'
    }
}
