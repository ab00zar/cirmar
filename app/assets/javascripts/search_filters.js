alert("hi");
var ready = function(){
////////////////   Search Filter - Type de messages    ///////////////////////////////////

      $("#m1").on('change', function(){
          insertOneParam("type_de_message", "1");
        });

      $("#m2").on('change', function(){
          insertOneParam("type_de_message", "2");
        });
 
       $("#m3").on('change', function(){
          insertOneParam("type_de_message", "3");
        });

      $("#m4").on('change', function(){
          insertOneParam("type_de_message", "4");
        });

      $("#m5").on('change', function(){
          insertOneParam("type_de_message", "5");
        });

      $("#m18").on('change', function(){
          insertOneParam("type_de_message", "18");
        });

      $("#m19").on('change', function(){
          insertOneParam("type_de_message", "19");
        });

      $("#mall").on('change', function(){
          insertOneParam("type_de_message", "all");
        });      

/////////////////   Search Filter - Type de Navire    ///////////////////////////////////

      $("#n50").on('change', function(){
          insertOneParam("type_de_navire", "50");
        });

      $("#n51").on('change', function(){
          insertOneParam("type_de_navire", "51");
        });

      $("#n52").on('change', function(){
          insertOneParam("type_de_navire", "52");
        });

      $("#n53").on('change', function(){
          insertOneParam("type_de_navire", "53");
        });

      $("#n54").on('change', function(){
          insertOneParam("type_de_navire", "54");
        });

      $("#n55").on('change', function(){
          insertOneParam("type_de_navire", "55");
        });

      $("#n56").on('change', function(){
          insertOneParam("type_de_navire", "56");
        });

      $("#n57").on('change', function(){
          insertOneParam("type_de_navire", "57");
        });

      $("#n58").on('change', function(){
          insertOneParam("type_de_navire", "58");
        });

      $("#n59").on('change', function(){
          insertOneParam("type_de_navire", "59");
        });

      $("#nall").on('change', function(){
          insertOneParam("type_de_navire", "all");
        });      



 function insertOneParam(key, value) {
        key = escape(key); //value = escape(value);
        
        var kvp = document.location.search.substr(1).split('&');

        if (kvp == '') {
            document.location.search = '?' + key + '=' + value;
        }
        else {

            var i = kvp.length; var x; while (i--) {
                x = kvp[i].split('=');

                if (x[0] == key) {
                    x[1] = value;
                    kvp[i] = x.join('=');
                    break;
                }
            }

            if (i < 0) { kvp[kvp.length] = [key, value].join('='); }

            //this will reload the page, it's likely better to store this until finished
            document.location.search = kvp.join('&');
        }
}     

};

$(document).ready(ready);
$(document).on('page:load', ready);