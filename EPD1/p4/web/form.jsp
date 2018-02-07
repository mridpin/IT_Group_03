<%! 

    String isTrabaja,estado,auxIngresos,auxGastos,nombre,apellidos;
    int ingresos,gastos;

%>

<%-- We first check where we are coming from and then we check if we can provide the loan, then we validate the inputs --%>
<% if(request.getParameter("enviar")!=null)
{
    isTrabaja = (String)request.getParameter("trabaja");
    estado = (String)request.getParameter("estado");
    nombre = (String) request.getParameter("nombre");
    apellidos = (String) request.getParameter("apellidos");
    //We can't convert them directly to numbers since it can throw an exception
    auxIngresos = request.getParameter("ingresos");
    auxGastos = request.getParameter("gastos");
    
    //We check if every input has been provided
    if(isTrabaja!=null && !auxIngresos.isEmpty() && !auxGastos.isEmpty() && !nombre.isEmpty() && !apellidos.isEmpty())
    {
        
        //We check if name and last name only have letters and spaces
        
        if(nombre.matches("^[ A-Za-z]+$") && apellidos.matches("^[ A-Za-z]+$"))
        {

            //We check to see if ingresos and gastos are numbers and also if they are positive
            if(auxIngresos.matches("[0-9]+") && auxGastos.matches("[0-9]+"))
            {
            ingresos = Integer.parseInt(auxIngresos);
            gastos = Integer.parseInt(auxGastos);

            //Loan conditions
            if((isTrabaja.equals("si") && ingresos>gastos) || (estado.equals("casado") && ingresos>gastos*2))
            {%>
                 <strong>Cr&eacute;dito Concedido</strong>       
            <%}
            else
            {%>
                 <strong>Cr&eacute;dito Denegado</strong>
            <%}
            }
            else
            {%>
            <strong>El ingreso y los gastos tienen que ser n&uacute;meros positivos </strong>
            <%}}
       else
        {%>
        <strong>El nombre y el apellido no pueden contener n&uacute;meros</strong>
        <%}

}
    else
    {%>
    <strong>Ninguno de los campos deben estar vac&iacute;os </strong>
    <%}
}
else
{
%>
        <%-- Form segment--%>
        Nombre: <input type="text" name="nombre">
        <br>
        Apellidos: <input type="text" name="apellidos">
        <br>
        Estado civil: <select name="estado">
            <option value="soltero">soltero</option>
            <option value="casado">casado</option>
            <option value="otros">otros</option>
        </select>
        <br>
        &iquest;Trabaja? S&iacute;<input type="radio" name="trabaja" value="si"> No <input type="radio" name="trabaja" value="no">
        <br>
        Ingresos (anual en &euro;): <input type="text" name="ingresos">
        <br>
        Gastos (anual en &euro;): <input type="text" name="gastos">
        <br>
        <input type="submit" name="enviar" value="Submit">

<%}%>