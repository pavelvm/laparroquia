<%@ page import="com.yourapp.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="producto.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${productoInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${productoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="producto.entradas.label" default="Entradas" />
		
	</label>
	<g:select name="entradas" from="${com.yourapp.Entrada.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.entradas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombreProducto', 'error')} ">
	<label for="nombreProducto">
		<g:message code="producto.nombreProducto.label" default="Nombre Producto" />
		
	</label>
	<g:textField name="nombreProducto" value="${productoInstance?.nombreProducto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'tipoProducto', 'error')} ">
	<label for="tipoProducto">
		<g:message code="producto.tipoProducto.label" default="Tipo Producto" />
		
	</label>
	<g:textField name="tipoProducto" value="${productoInstance?.tipoProducto}"/>
</div>

