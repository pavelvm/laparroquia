<%@ page import="com.yourapp.Entrada" %>



<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'bar', 'error')} required">
	<label for="bar">
		<g:message code="entrada.bar.label" default="Bar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bar" name="bar.id" from="${com.yourapp.Bar.list()}" optionKey="id" required="" value="${entradaInstance?.bar?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="entrada.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${entradaInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'cervezas', 'error')} ">
	<label for="cervezas">
		<g:message code="entrada.cervezas.label" default="Cervezas" />
		
	</label>
	<g:select name="cervezas" from="${com.yourapp.Cerveza.list()}" multiple="multiple" optionKey="id" size="5" value="${entradaInstance?.cervezas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'etiquetaVino', 'error')} ">
	<label for="etiquetaVino">
		<g:message code="entrada.etiquetaVino.label" default="Etiqueta Vino" />
		
	</label>
	<g:textField name="etiquetaVino" value="${entradaInstance?.etiquetaVino}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'precioCompra', 'error')} required">
	<label for="precioCompra">
		<g:message code="entrada.precioCompra.label" default="Precio Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioCompra" value="${fieldValue(bean: entradaInstance, field: 'precioCompra')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'precioUnitario', 'error')} required">
	<label for="precioUnitario">
		<g:message code="entrada.precioUnitario.label" default="Precio Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioUnitario" value="${fieldValue(bean: entradaInstance, field: 'precioUnitario')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'precioVenta', 'error')} required">
	<label for="precioVenta">
		<g:message code="entrada.precioVenta.label" default="Precio Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioVenta" value="${fieldValue(bean: entradaInstance, field: 'precioVenta')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'proveedor', 'error')} required">
	<label for="proveedor">
		<g:message code="entrada.proveedor.label" default="Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${com.yourapp.Proveedor.list()}" optionKey="id" required="" value="${entradaInstance?.proveedor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'refrescos', 'error')} ">
	<label for="refrescos">
		<g:message code="entrada.refrescos.label" default="Refrescos" />
		
	</label>
	<g:select name="refrescos" from="${com.yourapp.Refresco.list()}" multiple="multiple" optionKey="id" size="5" value="${entradaInstance?.refrescos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entradaInstance, field: 'vinos', 'error')} ">
	<label for="vinos">
		<g:message code="entrada.vinos.label" default="Vinos" />
		
	</label>
	<g:select name="vinos" from="${com.yourapp.Vino.list()}" multiple="multiple" optionKey="id" size="5" value="${entradaInstance?.vinos*.id}" class="many-to-many"/>
</div>

