function previewImage() {
    const preview = document.querySelector('img');
    const file = document.getElementById('input[type=file]');
    const reader = new FileReader();

    reader.addEventListener("load", function () {
        preview.src = reader.result;
    }, false);

    if (file) {
        reader.readAsDataURL(file);
    }
}