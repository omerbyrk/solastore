
var deviceIDInterval = setInterval(() => {
    setDeviceID();
}, 1000);

var advertisementInterval = setInterval(() => {
    setAdvertisementInterval();
}, 1000);

var linkLookerInterval = setInterval(() => {
    setLinkLooker();
}, 500);

var setDeviceID = () => {
    if (document.getElementsByName('firebase_token') == null) return;

    var allFirebaseTokenInputs = document.getElementsByName("firebase_token");
    for (var i = 0; i < allFirebaseTokenInputs.length; i++) {
        var firebaseTokenInput = allFirebaseTokenInputs[i];
        firebaseTokenInput.value = firebaseToken;
    }
}

var setAdvertisementInterval = () => {
    var allAdbuttons = document.getElementsByClassName("reklam");

    for (var i = 0; i < allAdbuttons.length; i++) {
        var adButton = allAdbuttons[i];
        adButton.addEventListener("click", advertisementOnClick);
    }

}

var advertisementOnClick = () => {
    Advertisement.postMessage("Click advertisementOnClick!");
}

var setLinkLooker = () => {
    var allLink = document.getElementsByTagName("a");
    for (var i = 0; i < allLink.length; i++) {
        var link = allLink[i];
        link.addEventListener("click", (e) => linkClick(link, e));
    }
}

var linkClick = (element, e) => {
    /*console.log("Link");
    console.log(element.href);
    if(element.href && element.href !== "#" && element.href.indexOf(document.location.hostname) == -1 ) {
        console.log("lookout link detected");
        e.preventDefault();
        Linkout.postMessage("Click advertisementOnClick!");
    }*/
}


