package com.yourapp



import org.junit.*
import grails.test.mixin.*

@TestFor(RefrescoController)
@Mock(Refresco)
class RefrescoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/refresco/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.refrescoInstanceList.size() == 0
        assert model.refrescoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.refrescoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.refrescoInstance != null
        assert view == '/refresco/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/refresco/show/1'
        assert controller.flash.message != null
        assert Refresco.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/refresco/list'

        populateValidParams(params)
        def refresco = new Refresco(params)

        assert refresco.save() != null

        params.id = refresco.id

        def model = controller.show()

        assert model.refrescoInstance == refresco
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/refresco/list'

        populateValidParams(params)
        def refresco = new Refresco(params)

        assert refresco.save() != null

        params.id = refresco.id

        def model = controller.edit()

        assert model.refrescoInstance == refresco
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/refresco/list'

        response.reset()

        populateValidParams(params)
        def refresco = new Refresco(params)

        assert refresco.save() != null

        // test invalid parameters in update
        params.id = refresco.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/refresco/edit"
        assert model.refrescoInstance != null

        refresco.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/refresco/show/$refresco.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        refresco.clearErrors()

        populateValidParams(params)
        params.id = refresco.id
        params.version = -1
        controller.update()

        assert view == "/refresco/edit"
        assert model.refrescoInstance != null
        assert model.refrescoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/refresco/list'

        response.reset()

        populateValidParams(params)
        def refresco = new Refresco(params)

        assert refresco.save() != null
        assert Refresco.count() == 1

        params.id = refresco.id

        controller.delete()

        assert Refresco.count() == 0
        assert Refresco.get(refresco.id) == null
        assert response.redirectedUrl == '/refresco/list'
    }
}
