package com.yourapp



import org.junit.*
import grails.test.mixin.*

@TestFor(BarrilController)
@Mock(Barril)
class BarrilControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/barril/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.barrilInstanceList.size() == 0
        assert model.barrilInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.barrilInstance != null
    }

    void testSave() {
        controller.save()

        assert model.barrilInstance != null
        assert view == '/barril/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/barril/show/1'
        assert controller.flash.message != null
        assert Barril.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/barril/list'

        populateValidParams(params)
        def barril = new Barril(params)

        assert barril.save() != null

        params.id = barril.id

        def model = controller.show()

        assert model.barrilInstance == barril
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/barril/list'

        populateValidParams(params)
        def barril = new Barril(params)

        assert barril.save() != null

        params.id = barril.id

        def model = controller.edit()

        assert model.barrilInstance == barril
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/barril/list'

        response.reset()

        populateValidParams(params)
        def barril = new Barril(params)

        assert barril.save() != null

        // test invalid parameters in update
        params.id = barril.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/barril/edit"
        assert model.barrilInstance != null

        barril.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/barril/show/$barril.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        barril.clearErrors()

        populateValidParams(params)
        params.id = barril.id
        params.version = -1
        controller.update()

        assert view == "/barril/edit"
        assert model.barrilInstance != null
        assert model.barrilInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/barril/list'

        response.reset()

        populateValidParams(params)
        def barril = new Barril(params)

        assert barril.save() != null
        assert Barril.count() == 1

        params.id = barril.id

        controller.delete()

        assert Barril.count() == 0
        assert Barril.get(barril.id) == null
        assert response.redirectedUrl == '/barril/list'
    }
}
