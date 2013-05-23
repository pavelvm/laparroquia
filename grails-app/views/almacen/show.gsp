
<%@ page import="com.yourapp.Almacen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'almacen.label', default: 'Almacen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-almacen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-almacen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list almacen">
			
				<g:if test="${almacenInstance?.bar}">
				<li class="fieldcontain">
					<span id="bar-label" class="property-label"><g:message code="almacen.bar.label" default="Bar" /></span>
					
						<span class="property-value" aria-labelledby="bar-label"><g:link controller="bar" action="show" id="${almacenInstance?.bar?.id}">${almacenInstance?.bar?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${almacenInstance?.entradas}">
				<li class="fieldcontain">
					<span id="entradas-label" class="property-label"><g:message code="almacen.entradas.label" default="Entradas" /></span>
					
						<g:each in="${almacenInstance.entradas}" var="e">
						<span class="property-value" aria-labelledby="entradas-label"><g:link controller="entrada" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${almacenInstance?.nombreAlmacen}">
				<li class="fieldcontain">
					<span id="nombreAlmacen-label" class="property-label"><g:message code="almacen.nombreAlmacen.label" default="Nombre Almacen" /></span>
					
						<span class="property-value" aria-labelledby="nombreAlmacen-label"><g:fieldValue bean="${almacenInstance}" field="nombreAlmacen"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${almacenInstance?.id}" />
					<g:link class="edit" action="edit" id="${almacenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
