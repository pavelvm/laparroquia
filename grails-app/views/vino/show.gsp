
<%@ page import="com.yourapp.Vino" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vino.label', default: 'Vino')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vino" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vino" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vino">
			
				<g:if test="${vinoInstance?.almacen}">
				<li class="fieldcontain">
					<span id="almacen-label" class="property-label"><g:message code="vino.almacen.label" default="Almacen" /></span>
					
						<span class="property-value" aria-labelledby="almacen-label"><g:link controller="almacen" action="show" id="${vinoInstance?.almacen?.id}">${vinoInstance?.almacen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vinoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="vino.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${vinoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vinoInstance?.etiquetaVino}">
				<li class="fieldcontain">
					<span id="etiquetaVino-label" class="property-label"><g:message code="vino.etiquetaVino.label" default="Etiqueta Vino" /></span>
					
						<span class="property-value" aria-labelledby="etiquetaVino-label"><g:fieldValue bean="${vinoInstance}" field="etiquetaVino"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vinoInstance?.medida}">
				<li class="fieldcontain">
					<span id="medida-label" class="property-label"><g:message code="vino.medida.label" default="Medida" /></span>
					
						<span class="property-value" aria-labelledby="medida-label"><g:link controller="medida" action="show" id="${vinoInstance?.medida?.id}">${vinoInstance?.medida?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vinoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="vino.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${vinoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vinoInstance?.ventas}">
				<li class="fieldcontain">
					<span id="ventas-label" class="property-label"><g:message code="vino.ventas.label" default="Ventas" /></span>
					
						<span class="property-value" aria-labelledby="ventas-label"><g:link controller="venta" action="show" id="${vinoInstance?.ventas?.id}">${vinoInstance?.ventas?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${vinoInstance?.id}" />
					<g:link class="edit" action="edit" id="${vinoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
