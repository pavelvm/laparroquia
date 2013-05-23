<%@ page import="com.yourapp.Cerveza" %>



<div class="fieldcontain ${hasErrors(bean: cervezaInstance, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="cerveza.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="almacen" name="almacen.id" from="${com.yourapp.Almacen.list()}" optionKey="id" required="" value="${cervezaInstance?.almacen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cervezaInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="cerveza.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${cervezaInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cervezaInstance, field: 'medida', 'error')} required">
	<label for="medida">
		<g:message code="cerveza.medida.label" default="Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="medida" type="number" value="${cervezaInstance.medida}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cervezaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="cerveza.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${cervezaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cervezaInstance, field: 'ventas', 'error')} required">
	<label for="ventas">
		<g:message code="cerveza.ventas.label" default="Ventas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ventas" name="ventas.id" from="${com.yourapp.Venta.list()}" optionKey="id" required="" value="${cervezaInstance?.ventas?.id}" class="many-to-one"/>
</div>

