jQuery(function($){
    'use strict';

	// How many images should we pre load on each side
	var loadThreshold = 3;

	// Find what image we should start at
	var startAt = 0; 
	var images = document.querySelectorAll(".slyde");
	if (window.location.hash){
		for (var i = 0; i < images.length; i++){
			if ( window.location.hash.substring(1) ==  images[i].getAttribute("id")){
				startAt=i;
				break;
			}
		}
	}

    var options = {
        horizontal: 1,
        itemNav: 'forceCentered',
        smart: 1,
        activateMiddle: 1,
        mouseDragging: 1,
        touchDragging: 1,
        releaseSwing: 1,
        startAt: startAt,
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

	function loadImages(frame){
		var first = Math.max(frame.rel.firstItem - loadThreshold, 0);
		var last = Math.min(
			Math.max(frame.rel.lastItem, frame.rel.activeItem) + loadThreshold,
			frame.items.length
		);
		var image = document.querySelectorAll(".slyde");

		for(var i = first; i < last; i++){
			if (image[i].getAttribute("src") == null){
				image[i].setAttribute('src', image[i].getAttribute("data-src"));
			}
		}
	}

    // Load next set of images when we get close to the end
    frame.on('change', function () {
		loadImages(frame);
    });

    // Reload on resize
    $(window).on('resize', function () {
        frame.reload();
    });
    $(window).on('load', function () {
        frame.init();
        //frame.reload();
    });
});

