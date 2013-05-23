<%@ page import="com.yourapp.Refresco" %>



<div class="fieldcontain ${hasErrors(bean: refrescoInstance, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="refresco.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="almacen" name="almacen.id" from="${com.yourapp.Almacen.list()}" optionKey="id" required="" value="${refrescoInstance?.almacen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refrescoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="refresco.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${refrescoInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: refrescoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="refresco.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${refrescoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: refrescoInstance, field: 'ventas', 'error')} required">
	<label for="ventas">
		<g:message code="refresco.ventas.label" default="Ventas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ventas" name="ventas.id" from="${com.yourapp.Venta.list()}" optionKey="id" required="" value="${refrescoInstance?.ventas?.id}" class="many-to-one"/>
</div>

