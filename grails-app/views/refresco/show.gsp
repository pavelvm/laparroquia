
<%@ page import="com.yourapp.Refresco" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'refresco.label', default: 'Refresco')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-refresco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-refresco" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list refresco">
			
				<g:if test="${refrescoInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="refresco.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${refrescoInstance?.almacen?.id}">${refrescoInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${refrescoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="refresco.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${refrescoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refrescoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="refresco.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${refrescoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${refrescoInstance?.ventas}">
				<li class="fieldcontain">
					<span id="ventas-label" class="property-label"><g:message code="refresco.ventas.label" default="Ventas" /></span>
					
						<span class="property-value" aria-labelledby="ventas-label"><g:link controller="venta" action="show" id="${refrescoInstance?.ventas?.id}">${refrescoInstance?.ventas?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${refrescoInstance?.id}" />
					<g:link class="edit" action="edit" id="${refrescoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
