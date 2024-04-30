document.addEventListener("DOMContentLoaded", function() {
    let subMenus = document.querySelectorAll('.popover.sub-menu');
    subMenus.forEach(function(menu) {
        let maxWidth = 0;
        menu.querySelectorAll('.dropdown-item').forEach(function(item) {
            if (item.offsetWidth > maxWidth) {
                maxWidth = item.offsetWidth;
            }
        });
        menu.style.width = maxWidth + 'px';
    });
});