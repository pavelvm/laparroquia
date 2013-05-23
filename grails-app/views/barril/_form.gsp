<%@ page import="com.yourapp.Barril" %>



<div class="fieldcontain ${hasErrors(bean: barrilInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="barril.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${barrilInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: barrilInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="barril.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${barrilInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: barrilInstance, field: 'listrosBarril', 'error')} required">
	<label for="listrosBarril">
		<g:message code="barril.listrosBarril.label" default="Listros Barril" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="listrosBarril" type="number" value="${barrilInstance.listrosBarril}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: barrilInstance, field: 'pecio', 'error')} required">
	<label for="pecio">
		<g:message code="barril.pecio.label" default="Pecio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pecio" value="${fieldValue(bean: barrilInstance, field: 'pecio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: barrilInstance, field: 'precioLitro', 'error')} required">
	<label for="precioLitro">
		<g:message code="barril.precioLitro.label" default="Precio Litro" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioLitro" value="${fieldValue(bean: barrilInstance, field: 'precioLitro')}" required=""/>
</div>

