<%@ page import="com.yourapp.Medida" %>



<div class="fieldcontain ${hasErrors(bean: medidaInstance, field: 'copasMinimas', 'error')} required">
	<label for="copasMinimas">
		<g:message code="medida.copasMinimas.label" default="Copas Minimas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="copasMinimas" type="number" value="${medidaInstance.copasMinimas}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medidaInstance, field: 'medida', 'error')} required">
	<label for="medida">
		<g:message code="medida.medida.label" default="Medida" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="medida" value="${fieldValue(bean: medidaInstance, field: 'medida')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: medidaInstance, field: 'nombreDescripcion', 'error')} ">
	<label for="nombreDescripcion">
		<g:message code="medida.nombreDescripcion.label" default="Nombre Descripcion" />
		
	</label>
	<g:textField name="nombreDescripcion" value="${medidaInstance?.nombreDescripcion}"/>
</div>

