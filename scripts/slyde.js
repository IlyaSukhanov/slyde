jQuery(function($){
    'use strict';
    var options = {
        horizontal: 1,
        itemNav: 'forceCentered',
        smart: 1,
        activateMiddle: 1,
        mouseDragging: 1,
        touchDragging: 1,
        releaseSwing: 1,
        startAt: 0,
        scrollBar: '#scrollbar',
        scrollBy: 1,
        speed: 100,
        elasticBounds: 1,
        easing: 'easeOutExpo',
        dragHandle: 1,
        dynamicHandle: 1,
        clickBar: 1,
        prev: '#prev',
        next: '#next'
    };
    var frame = new Sly('#frame', options);
    var $items = $('#items');
    var imageList={};
    $.ajax({
        'async': false,
        'global': false,
        'url': 'list.json',
        'dataType': "json",
        'success': function (data) {
            imageList=data;
        }
    });

    function populate(count) {
        console.log("loading:" + count)
        var output = '';
        var fileName = '';
        var description = '';
        var title = '';
        var offset = $items.children().length;
        for (var i = 0; i < count && (offset +i+1) <= imageList.images.length; i++) {
            fileName = imageList.images[offset + i].filename;
            title =  imageList.images[offset + i].title;
            description = imageList.images[offset + i].description;
            output +=   '<li>' +
                            '<div class=\'image\'>' +
                                '<img src=\'' + fileName +'\'/>' +
                                '<h2 class=\'hide\'>' + title + '</h2>'+
                                '<p class=\'hide\'>' + description  +'</p>'+
                            '</div>' +
                        '</li>';
        }
        return $items.append(output);
    }

    // Load next set of images when we get close to the end
    frame.on('change', function () {
        if( this.rel.lastItem >= ($items.children().length - 3) && ($items.children().length < imageList.images.length)){
            populate(3)
            this.reload();
        }
    });

    // Populate items
    populate(3);

    // Initiate Sly
    frame.init();

    // Reload on resize
    $(window).on('resize', function () {
        frame.reload();
    });
});

