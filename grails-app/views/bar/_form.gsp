<%@ page import="com.yourapp.Bar" %>



<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="bar.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${barInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'nombreBar', 'error')} ">
	<label for="nombreBar">
		<g:message code="bar.nombreBar.label" default="Nombre Bar" />
		
	</label>
	<g:textField name="nombreBar" value="${barInstance?.nombreBar}"/>
</div>

