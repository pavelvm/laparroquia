<%@ page import="com.yourapp.Venta" %>



<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'nombreCliente', 'error')} required">
	<label for="nombreCliente">
		<g:message code="venta.nombreCliente.label" default="Nombre Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCliente" required="" value="${ventaInstance?.nombreCliente}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="venta.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${ventaInstance.constraints.status.inList}" required="" value="${ventaInstance?.status}" valueMessagePrefix="venta.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'totalCuenta', 'error')} required">
	<label for="totalCuenta">
		<g:message code="venta.totalCuenta.label" default="Total Cuenta" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalCuenta" value="${fieldValue(bean: ventaInstance, field: 'totalCuenta')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'fechaVenta', 'error')} required">
	<label for="fechaVenta">
		<g:message code="venta.fechaVenta.label" default="Fecha Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaVenta" precision="day"  value="${ventaInstance?.fechaVenta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'cervezas', 'error')} ">
	<label for="cervezas">
		<g:message code="venta.cervezas.label" default="Cervezas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventaInstance?.cervezas?}" var="c">
    <li><g:link controller="cerveza" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cerveza" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cerveza.label', default: 'Cerveza')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'descipcion', 'error')} ">
	<label for="descipcion">
		<g:message code="venta.descipcion.label" default="Descipcion" />
		
	</label>
	<g:textField name="descipcion" value="${ventaInstance?.descipcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'refrescos', 'error')} ">
	<label for="refrescos">
		<g:message code="venta.refrescos.label" default="Refrescos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventaInstance?.refrescos?}" var="r">
    <li><g:link controller="refresco" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="refresco" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'refresco.label', default: 'Refresco')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'vinos', 'error')} ">
	<label for="vinos">
		<g:message code="venta.vinos.label" default="Vinos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventaInstance?.vinos?}" var="v">
    <li><g:link controller="vino" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vino" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vino.label', default: 'Vino')])}</g:link>
</li>
</ul>

</div>

