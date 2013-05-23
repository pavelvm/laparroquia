
<%@ page import="com.yourapp.Producto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-producto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-producto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list producto">
			
				<g:if test="${productoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="producto.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${productoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="producto.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.entradas}">
				<li class="fieldcontain">
					<span id="entradas-label" class="property-label"><g:message code="producto.entradas.label" default="Entradas" /></span>
					
						<g:each in="${productoInstance.entradas}" var="e">
						<span class="property-value" aria-labelledby="entradas-label"><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.nombreProducto}">
				<li class="fieldcontain">
					<span id="nombreProducto-label" class="property-label"><g:message code="producto.nombreProducto.label" default="Nombre Producto" /></span>
					
						<span class="property-value" aria-labelledby="nombreProducto-label"><g:fieldValue bean="${productoInstance}" field="nombreProducto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productoInstance?.tipoProducto}">
				<li class="fieldcontain">
					<span id="tipoProducto-label" class="property-label"><g:message code="producto.tipoProducto.label" default="Tipo Producto" /></span>
					
						<span class="property-value" aria-labelledby="tipoProducto-label"><g:fieldValue bean="${productoInstance}" field="tipoProducto"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productoInstance?.id}" />
					<g:link class="edit" action="edit" id="${productoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
