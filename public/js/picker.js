function farbtasticInit() {
    $('div.color_picker').farbtastic('#color');
};

function updateDemo() {
    $('form').submit(function(){ 
         var color = $('input:base_color').val();
         var demo = $('select').val();
         var demo_url = "/picker/" + demo;
         var css_url = "/css/" + demo + ".css?base_color=" + escape(color); 
         var link_tag = '<link class="demo" rel="stylesheet" type="text/css" ' 
                        + 'href="' + css_url + '"></link>';
         $('div.demo').load(demo_url);
         $('head').find('link.demo').remove();
         $('head').append(link_tag);
         return false;
    });
};

$(document).ready(function(){
    farbtasticInit();
    updateDemo();
    $('form').submit();
});
