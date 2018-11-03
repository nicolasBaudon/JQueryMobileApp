function funcionesVuelos (app){
    
    app.loaderVuelos = function () {
        $("#seleccionVuelo").on('pagebeforeshow', function (){
           var url = $(this).data('absUrl'); 
           var idPais = url.split('=')[1];
           if (idPais){
               app.buscarVuelo(idPais);
           }
        });
    };
    
    app.buscarVuelo = function (id){
      var url = "Controlador/Ruteador/Ruteador.php?accion=listar&Formulario=Vuelo";
      var datosEnviar = {id: id};
        $.ajax({
           url: url,
           method:"POST",
           dataType: "json",
           data: datosEnviar,
           success: function (datosRecibidos){
               app.cargarVuelos(datosRecibidos);
           },
           error: function (datosRecibidos){
               alert("Error en el Servidor Vuelos")
           }
        });
    };
    app.cargarVuelos = function(datos){
      var liAerolinea = "";
      var destino = "";
      $.each(datos, function(index, vuelo){
          liAerolinea += "<li class='roboto'>"+ vuelo.aerolinea +"<span></span>$" +  vuelo.precio + "</li>";
          destino =  "Vuelos a "+vuelo.destino+"";
        });
      $("#tituloDestino").text(destino);
      $("#listaAerolinea").html(liAerolinea).listview('refresh');
    };
    
    app.loaderVuelos();
};


