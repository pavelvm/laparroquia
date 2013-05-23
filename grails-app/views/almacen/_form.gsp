<%@ page import="com.yourapp.Almacen" %>



<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'bar', 'error')} required">
	<label for="bar">
		<g:message code="almacen.bar.label" default="Bar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bar" name="bar.id" from="${com.yourapp.Bar.list()}" optionKey="id" required="" value="${almacenInstance?.bar?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'entradas', 'error')} ">
	<label for="entradas">
		<g:message code="almacen.entradas.label" default="Entradas" />
		
	</label>
	<g:select name="entradas" from="${com.yourapp.Entrada.list()}" multiple="multiple" optionKey="id" size="5" value="${almacenInstance?.entradas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: almacenInstance, field: 'nombreAlmacen', 'error')} ">
	<label for="nombreAlmacen">
		<g:message code="almacen.nombreAlmacen.label" default="Nombre Almacen" />
		
	</label>
	<g:textField name="nombreAlmacen" value="${almacenInstance?.nombreAlmacen}"/>
</div>

