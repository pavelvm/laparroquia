
<%@ page import="com.yourapp.Cerveza" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cerveza.label', default: 'Cerveza')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cerveza" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cerveza" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cerveza">
			
				<g:if test="${cervezaInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="cerveza.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${cervezaInstance?.almacen?.id}">${cervezaInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cervezaInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="cerveza.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${cervezaInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cervezaInstance?.medida}">
				<li class="fieldcontain">
					<span id="medida-label" class="property-label"><g:message code="cerveza.medida.label" default="Medida" /></span>
					
						<span class="property-value" aria-labelledby="medida-label"><g:fieldValue bean="${cervezaInstance}" field="medida"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cervezaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="cerveza.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${cervezaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cervezaInstance?.ventas}">
				<li class="fieldcontain">
					<span id="ventas-label" class="property-label"><g:message code="cerveza.ventas.label" default="Ventas" /></span>
					
						<span class="property-value" aria-labelledby="ventas-label"><g:link controller="venta" action="show" id="${cervezaInstance?.ventas?.id}">${cervezaInstance?.ventas?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cervezaInstance?.id}" />
					<g:link class="edit" action="edit" id="${cervezaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
