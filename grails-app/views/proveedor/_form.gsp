<%@ page import="com.yourapp.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="proveedor.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${proveedorInstance.constraints.status.inList}" required="" value="${proveedorInstance?.status}" valueMessagePrefix="proveedor.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="proveedor.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${proveedorInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="proveedor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${proveedorInstance?.nombre}"/>
</div>

