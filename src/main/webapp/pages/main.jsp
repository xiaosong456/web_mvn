<%--
  Created by IntelliJ IDEA.
  User: lxs
  Date: 2018/1/7
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>love</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.tiles.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/snow/jquery.flurry.js"></script>
    <script src="${pageContext.request.contextPath}/js/main/jquery.tiles.js"></script>
</head>
<body>
<main class="main">
    <button onclick="changeSnowType();"></button>
</main>

<div class="roat">
<div class="title">
    <label>Effect:</label>
    <select id="effects-select">
        <option value="default">default</option>
        <option value="simple">simple</option>
        <option value="left">left</option>
        <option value="up">up</option>
        <option value="leftright">leftright</option>
        <option value="updown">updown</option>
        <option value="switchlr">switchlr</option>
        <option value="switchud">switchud</option>
        <option value="fliplr">fliplr</option>
        <option value="flipud">flipud</option>
        <option value="reduce">reduce</option>
        <option value="360">360</option>
    </select>
   <%-- <div class="code">
        <code>x: 6</code>
        <code>y: 4</code>
        <code>random: true</code>
    </div>--%>
    <button type="button" class="start action">Play</button>
    <button type="button" class="stop action">Stop</button>
</div>

<div class="slider-wrap">
    <div class="slider">
        <p><strong>Pig ham:</strong> hock pork loin brisket pastrami frankfurter andouille.</p>
        <img src="../images/main/img01.png"><p><strong>Sausage:</strong> ground round sirloin ball tip beef ribs.</p>
        <img src="../images/main/img02.png"><p><strong>Pig ham:</strong> hock pork loin brisket pastrami frankfurter andouille.</p>
        <img src="../images/main/img03.png"><p><strong>Pork turkey:</strong> shoulder, filet mignon chuck t-bone bacon.</p>
        <img src="../images/main/img04.png"><p><strong>Short loin:</strong> pig jowl fatback, pork loin pork chop.</p>
        <img src="../images/main/img05.png"><p><strong>Sausage:</strong> ground round sirloin ball tip beef ribs.</p>
        <img src="../images/main/img06.png"><p><strong>Pig ham:</strong> hock pork loin brisket pastrami frankfurter andouille.</p>
        <img src="../images/main/img07.png"><p><strong>Pork turkey:</strong> shoulder, filet mignon chuck t-bone bacon.</p>
        <img src="../images/main/img08.png"><p><strong>Short loin:</strong> pig jowl fatback, pork loin pork chop.</p>
        <img src="../images/main/img09.png"><p><strong>Sausage:</strong> ground round sirloin ball tip beef ribs.</p>
        <img src="../images/main/img10.png"><p><strong>Pig ham:</strong> hock pork loin brisket pastrami frankfurter andouille.</p>
    </div>
</div>
</div>



<script>

    /*************************飘雪特效************************************/
    var i=0;

    $( document ).ready( function() {
        defaultsnow();

    });

    function changeSnowType(){
        i++;
        if(i%3==1){
            customsnow();
        }else if(i%3==2){
            charactersnow();
        }else if(i%3==0){
            defaultsnow();
        }
    }





    function defaultsnow(){
        try {
            $('body').flurry('destroy');
        }
        catch(err) {
        }
        finally {
            $('body').flurry({
                height: 460,
                speed: 3600,
                wind: 200,
                windVariance: 20,
                frequency: 10,
                large: 20,
                small: 4
            });
        }
    }
    function customsnow(){
        try {
            $('body').flurry('destroy');
        }
        catch(err) {
        }
        finally {
            $('body').flurry({
                character: '❄❅❆*⛄☃',
                height: 460,
                speed: 3600,
                wind: 200,
                windVariance: 20,
                frequency: 10,
                large: 20,
                small: 4
            });
        }
    }
    function charactersnow(){
        try {
            $('body').flurry('destroy');
        }
        catch(err) {
        }
        finally {
            $('body').flurry({
                character: "LOVE顺红",
                color: ["#55476A", "#AE3D63", "#DB3853", "#F45C44", "#F8B646"],
                speed: 3600,
                height: 460,
                frequency: 60,
                small: 10,
                large: 30,
                rotation: 90,
                rotationVariance: 20,
                startRotation: 5,
                wind: 10,
                windVariance: 100,
                opacityEasing: "cubic-bezier(1,0,.96,.9)"
            });
        }
    }

/*************************轮播图片************************************/

    var $slider = $('.slider-wrap');
    var html = $slider.html();

    // Options

    var defaults = {
        thumbSize:20,
        onSlideshowEnd:function(){
            $('.stop, .start').toggle()
        }
    };

    var effects = {
        'default': { x:6, y:4, random: true },
        simple: { x:6, y:4, effect: 'simple', random: true },
        left: { x:1, y:8, effect: 'left' },
        up: { x:20, y:1, effect: 'up', rewind: 60, backReverse: true },
        leftright: { x:1, y:8, effect: 'leftright' },
        updown: { x:20, y:1, effect: 'updown', cssSpeed: 500, backReverse: true },
        switchlr: { x:20, y:1, effect: 'switchlr', backReverse: true },
        switchud: { x:1, y:8, effect: 'switchud' },
        fliplr: { x:20, y:1, effect: 'fliplr', backReverse: true },
        flipud: { x:20, y:3, effect: 'flipud', reverse: true, rewind: 75 },
        reduce: { x:6, y:4, effect: 'reduce' },
        360: { x:1, y:1, effect: '360', fade: true, cssSpeed: 600 }
    };

    $('#effects-select').change(function(){
        var effect = $(this).val();
        $slider.fadeTo( 0,0 ).html( html );
        $('.stop').hide();
        $('.start').show();

        setTimeout(function(){
            $('.slider').tilesSlider($.extend( {}, defaults, effects[ effect ]));
            $slider.fadeTo( 0,1 );
            $('body').removeClass('tiles-preload');
        }, 100 );

        $('.code').empty().html(function() {
            var e = effects[ effect ], c = [];
            for ( var i in e ) {
                if ( i !== 'effect' ) {
                    c.push('<code>'+ i +': '+ e[i] +'</code>');
                }
            }
            return c.join('');
        });
    });

    $('.start').click(function() {
        $(this).hide();
        $('.stop').show();
        $('.slider').tilesSlider('start');
    });

    $('.stop').click(function() {
        $(this).hide();
        $('.start').show();
        $('.slider').tilesSlider('stop');
    });

    $('.slider').tilesSlider( $.extend( {}, defaults, effects['default'] ) );
</script>
</body>
</html>
