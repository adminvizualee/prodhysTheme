window.onload = function() {
    setTimeout(function() {
        document.getElementById('welcome').style.display = 'block';
    }, 5000);

    document.getElementById('closeWelcome').onclick = function() {
        document.getElementById('welcome').style.display = 'none';
    };
};