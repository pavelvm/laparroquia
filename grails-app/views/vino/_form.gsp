<%@ page import="com.yourapp.Vino" %>



<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'almacen', 'error')} required">
	<label for="almacen">
		<g:message code="vino.almacen.label" default="Almacen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="almacen" name="almacen.id" from="${com.yourapp.Almacen.list()}" optionKey="id" required="" value="${vinoInstance?.almacen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="vino.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${vinoInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'etiquetaVino', 'error')} ">
	<label for="etiquetaVino">
		<g:message code="vino.etiquetaVino.label" default="Etiqueta Vino" />
		
	</label>
	<g:textField name="etiquetaVino" value="${vinoInstance?.etiquetaVino}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'medida', 'error')} required">
	<label for="medida">
		<g:message code="vino.medida.label" default="Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="medida" name="medida.id" from="${com.yourapp.Medida.list()}" optionKey="id" required="" value="${vinoInstance?.medida?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="vino.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${vinoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vinoInstance, field: 'ventas', 'error')} required">
	<label for="ventas">
		<g:message code="vino.ventas.label" default="Ventas" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ventas" name="ventas.id" from="${com.yourapp.Venta.list()}" optionKey="id" required="" value="${vinoInstance?.ventas?.id}" class="many-to-one"/>
</div>

