
<%@ page import="com.yourapp.Barril" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'barril.label', default: 'Barril')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-barril" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-barril" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list barril">
			
				<g:if test="${barrilInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="barril.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${barrilInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barrilInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="barril.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${barrilInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barrilInstance?.listrosBarril}">
				<li class="fieldcontain">
					<span id="listrosBarril-label" class="property-label"><g:message code="barril.listrosBarril.label" default="Listros Barril" /></span>
					
						<span class="property-value" aria-labelledby="listrosBarril-label"><g:fieldValue bean="${barrilInstance}" field="listrosBarril"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barrilInstance?.pecio}">
				<li class="fieldcontain">
					<span id="pecio-label" class="property-label"><g:message code="barril.pecio.label" default="Pecio" /></span>
					
						<span class="property-value" aria-labelledby="pecio-label"><g:fieldValue bean="${barrilInstance}" field="pecio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barrilInstance?.precioLitro}">
				<li class="fieldcontain">
					<span id="precioLitro-label" class="property-label"><g:message code="barril.precioLitro.label" default="Precio Litro" /></span>
					
						<span class="property-value" aria-labelledby="precioLitro-label"><g:fieldValue bean="${barrilInstance}" field="precioLitro"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${barrilInstance?.id}" />
					<g:link class="edit" action="edit" id="${barrilInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
