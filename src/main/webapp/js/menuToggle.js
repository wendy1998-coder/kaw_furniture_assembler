$(window).on("load", function () {
    console.log("loaded");
    const trigger = $("#mobileMenuTrigger");
    const items = document.getElementById("mobileMenuItems");

    trigger.on("click", function () {
        items.classList.toggle("visible")
    })
})