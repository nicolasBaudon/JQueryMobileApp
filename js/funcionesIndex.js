$(function (){
   var funcionSeleccion = {};
     
    (function (app){
        app.init = function(){
            app.loader();
            app.buscar("Pais");
            app.bindings();
            window.onload = function() {
                $.mobile.loading('hide');
            };
        }
        
        app.loader = function() {
            $(document).bind('mobileinit', function() {
                $.mobile.loader.prototype.options.text = "Cargando - Nombre Proyecto";
                $.mobile.loader.prototype.options.textVisible = true;
                $.mobile.loader.prototype.options.theme = "a";
                $.mobile.loader.prototype.options.html = "";
            });
            $.mobile.loading('show', {
                text: 'Nombre del Proyecto',
                textVisible: true,
                theme: 'a',
                html: ""
            });
        };
        
        app.buscar = function (tipo, id){
            if (tipo  == "Pais"){
                var url = "Controlador/Ruteador/Ruteador.php?accion=listar&Formulario=" + tipo;
                $.ajax({
                    url: url,
                    method: "POST",
                    dataType: "json",
                    success: function (datosRecibidos){
                        app.mostrar(datosRecibidos, tipo);
                    },
                    error: function (datosRecibidos){
                        alert("Error servidor Pais");
                    }
                }); 
            } else if (tipo == "Provincia") {
                if (id != 0){
                    var url = "Controlador/Ruteador/Ruteador.php?accion=listar&Formulario=" + tipo;
                    var datosEnviar = {id: id};
                    $.ajax({
                        url: url,
                        method: "POST",
                        dataType: "json",
                        data: datosEnviar,
                        success: function(datosRecibidos){
                            app.mostrar(datosRecibidos, tipo);
                        },
                        error: function (datosRecibidos){
                         alert("Error servidor Provincia");
                        }
                    });
                } else{
                    var opciones = "<option data-id_Provincia='0'>-(Seleccione una)-</option>";
                    $("#Provincia").html(opciones);
                    $("#Provincia").prop('disabled', true);
                    $("#Localidad").html("<option data-id_Localidad='0'>-(Seleccione una)-</option>");
                    $("#Localidad").prop('disabled', true);
                 }; 
            } else {
                if(id != 0){
                    var url = "Controlador/Ruteador/Ruteador.php?accion=listar&Formulario=" + tipo;
                    var datosEnviar = {id: id};
                    $.ajax({
                        url: url,
                        method: "POST",
                        dataType: "json",
                        data: datosEnviar,
                        success: function(datosRecibidos){
                            app.mostrar(datosRecibidos, tipo);
                        },
                        error: function (datosRecibidos){
                            alert("Error servidor Localidad");
                        }
                    });
                } else{ 
                    var opciones = "<option data-id_Localidad='0'>-(Seleccione una)-</option>";
                    $("#"+tipo).html(opciones);
                    $("#"+tipo).prop('disabled', true);
                };
            }
        };
        
        app.mostrar = function (datos, tipo){
            var opcion = "<option data-id_"+ tipo +"='0'>-(Seleccione una)-</option>";
            $.each(datos, function (index, iden){
                opcion += "<option data-id_"+ tipo +"='"+ eval("iden.id"+ tipo) +"'>"+ eval("iden.nombre"+tipo) + "</option>";
            });
            $("#"+tipo).html(opcion);
        };
        
        app.bindings = function(){
            
            $(document).on("pagebeforeload pageload pageloadfailed pagebeforechange pagechange pagechangefailed pagebeforeshow pagebeforehide pageshow pagehide pagebeforecreate pagecreate pageinit pageremove updatelayout", function(e) {
		console.log(e.type);
	    });
            
            $("#Pais").on('change', function(){
                $("#Provincia").selectmenu('enable');
                var id0 = $("#Pais option:selected").attr("data-id_Pais");
                console.log(id0);
                app.buscar("Provincia", id0); 
                $(".btn").attr('href','#seleccionVuelo?idPais='+id0);
            });
            
            $("#Provincia").on('change', function (){
                $("#Localidad").selectmenu('enable');
                var id1 = $("#Provincia option:selected").attr("data-id_Provincia");
                console.log(id1);
                app.buscar("Localidad", id1); 
            });
            
            $(".btn").on('click', function (){
                funcionesVuelos(app);
            });
        };
        
        app.init();
      
    })(funcionSeleccion);
    
});


